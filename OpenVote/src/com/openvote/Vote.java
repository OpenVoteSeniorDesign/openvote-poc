package com.openvote;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class Vote {

	@Id Long id;
	int candidate;
	boolean published;
	
	private Vote() {}
	
	public Vote(int candidate) {
		this.candidate = candidate;
		this.published = false;
	}

	public int getCandidate() {
		return candidate;
	}
	
}
