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

import org.apache.tools.ant.taskdefs.Sleep;

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

        randomSleepDelay();

        // get votes from data store filtered on property real/temp
        List<Candidate> candList = ObjectifyService.ofy().load().type(Candidate.class).filter("published ==", false).list(); // list
                                                                                                                             // is                                                                                                                   //                                                                                                                   // vote
        Map<Candidate.candidate, Integer> tally = new HashMap<Candidate.candidate, Integer>();
        for(Candidate c : candList){
            // tally.get( c.getCanditate() )
        }

        // ensure the anonimity is good
        // change all temp to real

        // Move Temp Votes From Temporary to Real
        // datasotre.getallVotes
        // for(String str : CloudStorage.listBucket("votestorage-temp")){
        // System.out.println(""+str);
        // }

        // require atleast one vote per candiate must be present before we can move votes over
        // also will time out

        // push votes to glcoud
        // datastore.clearVotes

        // UpdateAnalyts in a data trasnfer object
        // retaly totals store in glcloud

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

    }
}