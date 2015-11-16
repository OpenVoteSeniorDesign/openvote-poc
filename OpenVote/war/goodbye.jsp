<!DOCTYPE html>
<html lang="en">

  <head>

    <title>Goodbye</title>
    <link type="text/css" rel="stylesheet" href="/stylesheets/bootstrap.css"/>
    
  </head>
  
  <body>
  	<div class="page-header">
 		<img style="display: inline; width:50px;height:50px" src="http://www.clker.com/cliparts/B/B/Z/v/Z/Q/star-th.png" class="img-responsive" alt="Red Star">
  		<h2 style="display: inline"> OpenVote </h2>
  	</div>
  
    <div class="container">
		<div class="jumbotron">
			<h1>Thank you for voting!</h1>      
		   	<p>Be sure to visit http://openvote-poc.appspot.com/viewAllVotes.jsp later to see election progress and verify your vote using the vote ID given to you.</p>
		  	
			<div class="row">
				<div class="col-md-3">
					<form action="/results" method="post">
		    			<div><input id="btn_gotoliveresults" class="btn pull-left" type="submit" value="Click here to go to Live Results!"/></div>
					</form>
				</div>
				<div class="col-md-6"></div>
				<div class="col-md-3">
					<form action="/" method="post">
	    				<div><input id="btn_return_login" class="btn pull-right" type="submit" value="Return to Login"/></div>
	    			</form>
	    		</div>
		    </div>
		 
		</div>      
	</div>
	
  </body>
</html>