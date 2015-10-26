package com.openvote;


import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class VoteBatchCounter
{
	@Id Long id;
	int numBatches;
	
	//no-arg constructor required by Objectify
	private VoteBatchCounter() {}
	
	public VoteBatchCounter(int numBatches) {
		this.numBatches = numBatches;
	}

	public int getNumBatches() {
		return numBatches;
	}
	
	public int increment() {
		this.numBatches += 1;
		return numBatches;
	}

}
