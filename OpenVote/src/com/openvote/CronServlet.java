package com.openvote;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.cmd.LoadType;

@SuppressWarnings("serial")
public class CronServlet extends HttpServlet {
    private static final Logger _logger = Logger.getLogger(CronServlet.class.getName());
    private final String endl = "\r\n";
    private static final int range = 60;
    // Voting Authority Setup Parameters
    // private static Properties properties;
    // private static Storage storage;

    private static final int MAX_TIME_OUT = 100;
    private static final int TEMP_VOTE_BUFFER_FILL = Candidate.values().length + 1;

    // This adds a random amount of latency with a specified range in values and a desired offset in
    // units of seconds
    public void randomSleepDelay(){
        try{
            TimeUnit.SECONDS.sleep((long)(Math.random() * range));
        }catch(InterruptedException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException{

        /* 
         * 1. 
         * 
         * Random Time
         */
        
        randomSleepDelay();

        /* 
         * 2. 
         * 
         * Get votes from data store filtered on property published
         */
        
        List<Vote> voteList = ObjectifyService.ofy().load().type(Vote.class).filter("published ==", false).list();

        /* 
         * 3. 
         * 
         * Taly Up all of the unb-pulished votes // vote
         */
      
        Map<Candidate, Integer> tally = new HashMap<Candidate, Integer>();
        for(Vote v : voteList){
            Candidate key = Candidate.values()[v.getCandidate()];

            if(tally.containsKey(key) == false){
                tally.put(key, 1);
            }else{
                tally.put(key, tally.get(key) + 1);
            }
        }

        /*
         * 4. 
         * 
         * Anonymity Check :
         *    
         *     Require at least one vote per candidate must be present before we can move votes over
         *     numFakeBatches saved by CastFakeVotes atomically in data store
         *     
         *     Alternative condition:
         *     boolean anonimityTransfer = (tally.keySet().size() > Candidate.values().length) &&
         *     (candList.size()>TEMP_VOTE_BUFFER_FILL);
         */
        
        int numInstancesFakeBatches = ObjectifyService.ofy().load().type(VoteBatchCounter.class).count();
        VoteBatchCounter fakeBatches = null;
        if( numInstancesFakeBatches == 0){
            fakeBatches = null;
            System.err.println("Number of instances is 0 for VoteBatchCounter");
            System.exit(1);
        }else if(numInstancesFakeBatches == 1){
            fakeBatches = ObjectifyService.ofy().load().type(VoteBatchCounter.class).first().getValue();
        }else{ 
            System.err.println("Number of instances is greater that 1 for VoteBatchCounter");
            System.exit(1);
        }
        
        // As long as all the talys minus the number of fake votes is greater than 0 we are good
        boolean doNotPublish = true;
        for(Candidate c : tally.keySet()){
            doNotPublish &= tally.get(c)-fakeBatches.getNumBatches() > 0;
        }

        /*
         * 5.
         * 
         * Time Out Transfer and Publish Votes Publicly :
         *     Publish to data store after changing the variable
         *     Add Time Out based on MAX_TIME_OUT
         */

        int numInstances = ObjectifyService.ofy().load().type(TimeOut.class).count();
        TimeOut time = null;
        if( numInstances == 0){
            time = new TimeOut();
        }else if(numInstances == 1){
            time = ObjectifyService.ofy().load().type(TimeOut.class).first().getValue();
        }else{ 
            System.err.println("Number of instances is greater that 1 for timeout");
            System.exit(1);
        }
        
     
        if(time.incrementTimeOut() == true && doNotPublish==true){
            doNotPublish = false;
        }
        ObjectifyService.ofy().save().entity(time).now();
        
        // Publish if were good
        if(doNotPublish == false){
            for(Vote v : voteList){
                // 1 is going to work
                v.publish();
                ObjectifyService.ofy().save().entity(v).now();
            }
        }

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

    }
}
