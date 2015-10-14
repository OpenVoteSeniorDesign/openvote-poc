package com.openvote;

import java.util.UUID;

public class VoteKey {

	public VoteKey(UUID voteKey) {
		super();
		this.voteKey = voteKey;
	}

	UUID voteKey;

	private UUID getVoteKey() {
		return voteKey;
	}
	
	public String toString(){
		return this.voteKey.toString();
	}
}
