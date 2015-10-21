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

@SuppressWarnings("serial")
public class CronServlet extends HttpServlet {
    private static final Logger _logger = Logger.getLogger(CronServlet.class.getName());
    private final String endl = "\r\n";
    private static final int range = 60;
    private static final int offset = 60;
    // Voting Authority Setup Parameters
    // private static Properties properties;
    // private static Storage storage;

    private static final int MAX_TIME_OUT = 100;
    private static final int TEMP_VOTE_BUFFER_FILL = Candidate.values().length + 1;


    // This adds a random amount of latency with a specified range in values and a desired offset in
    // units of seconds
    public void randomSleepDelay(){
        try{
            TimeUnit.SECONDS.sleep((long)(Math.random() * range + offset));
        }catch(InterruptedException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException{
        
        // 1 Random Time
        randomSleepDelay();

        // 2 Get votes from data store filtered on property published
        List<Vote> voteList = ObjectifyService.ofy().load().type(Vote.class).filter("published ==", false).list(); 
        
        // 3 Taly Up all of the unb-pulished votes                                                                                                                // vote
        Map<Candidate, Integer> tally = new HashMap<Candidate, Integer>();
        for(Vote v : voteList){
            Candidate key = Candidate.values()[v.getCandidate()];
            
            if(tally.containsKey(key)==false){
                tally.put(key,1);
            }else{
                tally.put(key,tally.get(key)+1);
            }
        }
        
       /* 4 Anonymity Check : 
        * Require at least one vote per candidate must be present before we can move votes over
        * numFakeBatches saved by CastFakeVotes atomically and assumed to be only first Integer in data store
        * 
        * Alternative condition:
        * boolean anonimityTransfer = (tally.keySet().size() > Candidate.values().length) && (candList.size()>TEMP_VOTE_BUFFER_FILL);
        */
        
       int numFakeBatches = ObjectifyService.ofy().load().type(Integer.class).first().getValue() ; //this will be number of the fake vote clusters
       int numCandiates = Candidate.values().length;
       int realVotes =  voteList.size() - numFakeBatches * numCandiates;
       
       //As long as all the talys are greater than realVotes we can go ahead and publish
       boolean doNotPublish = true ; 
       for(Candidate c : tally.keySet()){
           doNotPublish &= tally.get(c) >= realVotes ;
       }
        
       
        
       /* TODO 5 Publish or Time Out Check : 
        * Publish to data store after changing the varible
        * TODO Add Time Out based on MAX_TIME_OUT
        * */
        
        if(doNotPublish == false){ 
            for(Vote v: voteList){
                //1 is going to work
                v.publish();
                ObjectifyService.ofy().save().entities(v);
                
                /*2
                ObjectifyService.ofy().toEntity(c).setProperty("published", true);*/
            }
        }else{ 
            /*
             * Integer intLoad = ObjectifyService.ofy().load().entity(Integer.class).safe();
            Integer timeOut = intLoad;
            
            if(timeOut.intValue()<MAX_TIME_OUT){ //Other Wise we gotta wait: increment time out counter and do nothing
                timeOut++;
            }else{ //If we are here we have reached the time out and we must
                                          //time out reached do transfer any ways
                timeout=0;                //reset timeout varible in data store

            }
            
            ObjectifyService.ofy().save().entity(timeOut);*/
        }

        /* TODO 6 Update Published Taly  
         * Load TallyClass from data store
         * Global Tally += local Tally Data of real and vake votes
         * Save TallClass in data store
         * */

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

    }
}