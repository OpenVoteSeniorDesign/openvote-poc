package com.openvote;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public enum Candidate { 
	
	BUSH("George Bush"), TRUMP("Donald Trump"), CLINTON("Bill Clinton"); 
    private String fullName;
    @Id long id;
    
    //no-arg constructor required by Objectify
    private Candidate() {}
    
    private Candidate(String brand) { 
        this.fullName = brand; 
    } 
    
    @Override 
    public String toString(){ 
        return fullName; 
    }
}
	