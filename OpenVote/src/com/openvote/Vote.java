package com.openvote;

public class Vote {

	Key voteKey;
	Candidate candidate;	//TODO discuss "Candidate" type, where "Candidate" is an Enum

	private Key getVoteKey() {
		return voteKey;
	}
	
	private void setVoteKey(Key voteKey) {
		this.voteKey = voteKey;
	}
	
	private Candidate getCandidate() {
		return candidate;
	}
	
	private void setCandidate(Candidate candidate) {
		this.candidate = candidate;
	}
}
