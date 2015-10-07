package com.openvote;

public class Vote {

	VoteKey voteKey;
	Candidate candidate;	//TODO discuss "Candidate" type, where "Candidate" is an Enum
	
	private VoteKey getVoteKey() {
		return voteKey;
	}
	
	private void setVoteKey(VoteKey voteKey) {
		this.voteKey = voteKey;
	}
	
	private Candidate getCandidate() {
		return candidate;
	}
	
	private void setCandidate(Candidate candidate) {
		this.candidate = candidate;
	}
}
