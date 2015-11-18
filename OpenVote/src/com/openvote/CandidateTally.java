package com.openvote;

public class CandidateTally {
	public String name;
	public Integer tally;


public CandidateTally(Candidate c){
	name = c.name();
	tally = 0;
}

public String getName(){
	return this.name;
}

public Integer getTally(){
	return this.tally;
}

}