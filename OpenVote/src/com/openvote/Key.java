package com.openvote;

import java.util.UUID;

public class Key {

	UUID voteKey;

	private UUID getVoteKey() {
		return voteKey;
	}

	private void setVoteKey(UUID voteKey) {
		this.voteKey = voteKey;
	}
}
