<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="static com.googlecode.objectify.ObjectifyService.ofy" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="com.freebiefinder.Post" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>Welcome to Freebie Finder</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

    <!-- Custom styles for this template -->
    <link href="stylesheets/customStyle.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries, just in case -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
	<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
      pageContext.setAttribute("user", user);
    }
	%>
    <div class="container">

      <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp" style="color:green"><strong>Freebie Finder</strong></a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="index.jsp">Home<span class="sr-only">(current)</span></a></li>
              <li><a href="about.jsp">About</a></li>
              <li><a href="contact.jsp">Contact</a></li>
            </ul>
            <%
              if (user != null){
            %>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="newFreebie.jsp">Post Freebie</a></li>
              <li><a href="discover.jsp">Find Freebies</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${fn:escapeXml(user.nickname)}<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Sign Out</a></li>
                  <li class="divider"></li>
                  <li class="dropdown-header">Account Tools</li>
                  <li><a href="subscriptionSettings.jsp">Subscription Settings</a></li>
                </ul>
              </li>
            </ul>
            <%
              }
              else{
            %>
            <ul class="nav navbar-nav navbar-right">
            	<li><a href="discover.jsp">Find Freebies</a></li>
            	<li><a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a></li>
            </ul>
            <%
              }
            %>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

      <!-- Main component for a primary marketing message or call to action -->
      <%
        ObjectifyService.register(Post.class);
        List<Post> Posts = ObjectifyService.ofy().load().type(Post.class).list();
        Collections.sort(Posts);
        Date today = new Date();
        long currentTime = today.getTime();
        for (int i = 0; i < Posts.size(); i++){
          Post freebieEvent = Posts.get(i);
          if(freebieEvent.getEndDate().getTime() <= currentTime || freebieEvent.shouldDelete()){
            ofy().delete().type(Post.class).id(freebieEvent.getId()).now();
            i--;
          }
        }
	  %>
      <div class="jumbotron">
        <h1>Welcome to Freebie Finder!</h1>
        <h3>What is this Gem?</h3>
        <p>Freebie Finder is a community of users who aim to find and help others find free stuff. Find the swag you didn't even know you were missing out on, and save some green!</p>
        <%
        if (Posts.size() == 1){
        %>
        <blockquote>There is currently <a href="discover.jsp"><strong>1 freebie</strong></a> posted on Freebie Finder! </blockquote>
        <%
        }
        else{
        %>
        <blockquote>There are currently <a href="discover.jsp"><strong><%= Posts.size() %> freebies</strong></a> posted on Freebie Finder! </blockquote>
        <%
        }
        %>
        <p>Find out which ones are near you!</p>
        <p>
          <a class="btn btn-lg btn-primary" href="discover.jsp" role="button">Find Freebies &raquo;</a>
        </p>
      </div>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  </body>
</html>
