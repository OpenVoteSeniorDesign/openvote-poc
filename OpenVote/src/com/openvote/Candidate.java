package com.openvote;

public enum Candidate { 
	BUSH("George Bush"), TRUMP("Donald Trump"), CLINTON("Bill Clinton"); 
    private String fullName;
    
    private Candidate(String brand) { 
        this.fullName = brand; 
    } 
    
    @Override 
    public String toString(){ 
        return fullName; 
    }
}
	//TODO hard code these in once the voting authority gives us the candidates
