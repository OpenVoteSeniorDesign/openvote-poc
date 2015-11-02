package com.openvote;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class TimeOut {
    
    @Id Long id;
    @Index int timeOutValue=0;
    
    private final int MAX_TIME_OUT = 5;
    
    boolean incrementTimeOut(){
       
        boolean ret = false;
        
        if(timeOutValue==MAX_TIME_OUT){            
            timeOutValue=0;
            ret = true;
        }else{
            timeOutValue++;
            ret = false;
        }
        
        return ret;
    }
    
}