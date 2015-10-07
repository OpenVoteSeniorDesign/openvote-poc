package com.openvote;

public class Vote {

	public Vote(Key voteKey) {
		super();
		this.voteKey = voteKey;
	}

	Key voteKey;
	Candidate candidate;	//TODO discuss "Candidate" type, where "Candidate" is an Enum
	
	private Key getVoteKey() {
		return voteKey;
	}
	
	private Candidate getCandidate() {
		return candidate;
	}
	
	private void setCandidate(Candidate candidate) {
		this.candidate = candidate;
	}
}
