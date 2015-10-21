package com.openvote;

<<<<<<< Upstream, based on origin/master
public enum Candidate { 	
	Dory, Nemo;
=======
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Index;

@Entity
public enum Candidate { 
	BUSH("George Bush"), TRUMP("Donald Trump"), CLINTON("Bill Clinton"); 
    private String fullName;
    
    @Index boolean published = false;
    
    private Candidate(String brand) { 
        this.fullName = brand; 
    } 
    
    @Override 
    public String toString(){ 
        return fullName; 
    }
>>>>>>> 79e06f3 Adding more details to Cron Servlet Still need to add update results and correct security conditions as to when to move over votes

    public void setPublished(boolean p){
        published=p;
    }
}
	
