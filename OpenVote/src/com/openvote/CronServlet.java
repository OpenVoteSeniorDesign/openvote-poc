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
        System.err.println("num unpublished votes: " + voteList.size());
        /* 
         * 3. 
         * 
         * Tally Up all of the unpublished votes // vote
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
        
        System.err.println("num candidates in tally: " + tally.keySet().size());
        // As long as each candidate has a vote, we can publish
        boolean doNotPublish = false;
        for(Candidate c : Candidate.values()){
        	System.err.println("candidate : " + c + ", tally: " + tally.get(c));
            if (!tally.containsKey(c)) {
            	doNotPublish = true;
            }
        }

        /*
         * 5.
         * 
         * Time Out Transfer and Publish Votes Publicly :
         *     Publish to data store after changing the variable
         *     Add Time Out based on MAX_TIME_OUT
         */
        TimeOut time = ObjectifyService.ofy().load().type(TimeOut.class).first().getValue();
        if (time == null) {
        	time = new TimeOut();
        	System.err.println("creating new TimeOut object");
        }
        if(doNotPublish == true){
            // If  the timeoutCounter rolls over time.incrementTimeOut() == true
            if(time.incrementTimeOut() == true){
                doNotPublish = false;
                System.err.println("TimeOut at: " + time.getTime());
            }
        }
        
        // Publish if we're good
        if(doNotPublish == false){
        	time.reset();
            for(Vote v : voteList){
                // 1 is going to work
                v.publish();
                ObjectifyService.ofy().save().entity(v).now();
            }
        }
        ObjectifyService.ofy().save().entity(time).now();

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

    }
}
