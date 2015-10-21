package com.openvote;

import java.io.IOException;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

import javax.mail.Address;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.apache.tools.ant.taskdefs.LoadResource;
import org.apache.tools.ant.taskdefs.Sleep;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.LoadResult;
import com.googlecode.objectify.Objectify;
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

    private static final String PROJECT_ID_PROPERTY = "project.id"; // openvote-poc
    private static final String APPLICATION_NAME_PROPERTY = "application.name";// openvote-poc
    private static final String ACCOUNT_ID_PROPERTY = "account.id";//
    private static final String PRIVATE_KEY_PATH_PROPERTY = "private.key.path";
    private static final int MAX_TIME_OUT = 0;
    private static final int TEMP_VOTE_BUFFER_FILL = Candidate.values().length + 1;

    private static final int
    static{
        // ObjectifyService.register(CLASSNAME.class); Register a class to use it in the datastore
    }

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
        List<Candidate> candList = ObjectifyService.ofy().load().type(Candidate.class).filter("published ==", false).list(); 
        
        // 3 Taly Up all of the unb-pulished votes                                                                                                                // vote
        Map<Candidate, Integer> tally = new HashMap<Candidate, Integer>();
        for(Candidate c : candList){
            tally.put(c,tally.get(c)+1);
            
        }
        
       /* 4 Anonymity Check : 
        * Require at least one vote per candidate must be present before we can move votes over
        * numFakeBatches saved by CastFakeVotes atomically and assumed to be only first Integer in data store
        * 
        * Alternative condition:
        * boolean anonimityTransfer = (tally.keySet().size() > Candidate.values().length) && (candList.size()>TEMP_VOTE_BUFFER_FILL);
        */
       
       int numFakeBatches = ObjectifyService.ofy().load().type(Integer.class).first().safe().intValue() ; //this will be number of the fake vote clusters
       int numCandiates = Candidate.values().length;
       int realVotes =  candList.size() - numFakeBatches * numCandiates;
       
       //As long as all the talys are greater than realVotes we can go ahead and publish
       boolean doNotPublish = true ; 
       for(Candidate c : tally.keySet()){
           doNotPublish &= tally.get(c) >= realVotes ;
       }
        
       
        
       /* TODO 5 Publish or Time Out Check : 
        * Publish to data store after changing the varible
        * TODO Add Time Out 
        * */
        
        if(doNotPublish == false){ 
            for(Candidate c: candList){
                //1 is going to work
                c.setPublished(true);
                ObjectifyService.ofy().save().entities(c);
                
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