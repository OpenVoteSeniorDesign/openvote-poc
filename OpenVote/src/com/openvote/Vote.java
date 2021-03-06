package com.openvote;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class Vote implements Serializable {

	@Id Long id;
	@Index int candidate;
	@Index boolean published;
	
	//no-arg constructor required by Objectify
	private Vote() {}
	
	public Vote(int candidate) {
		this.candidate = candidate;
		this.published = false;
	}

	public int getCandidate() {
		return candidate;
	}
	
	public Long getId() {
		return id;
	}
	
	public void publish() {
		this.published = true;
	}
	
}
