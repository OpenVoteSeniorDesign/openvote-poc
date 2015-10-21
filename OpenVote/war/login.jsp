<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
	<meta name="google-signin-scope" content="profile email">
	<meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
	<script src="https://apis.google.com/js/platform.js" async defer></script>
  </head>
  
  <body>
	  <meta name="google-signin-client_id" content="749386450710-tbgop7rt452651gatj8njc8ivn7jfv4t.apps.googleusercontent.com">
  <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
      <script>
        function onSignIn(googleUser) {
          // Useful data for your client-side scripts:
          var profile = googleUser.getBasicProfile();
          console.log("ID: " + profile.getId()); // Don't send this directly to your server!
          console.log("Name: " + profile.getName());
          console.log("Image URL: " + profile.getImageUrl());
          console.log("Email: " + profile.getEmail());

          // The ID token you need to pass to your backend:
          var id_token = googleUser.getAuthResponse().id_token;
          console.log("ID Token: " + id_token);
        };
      </script>
	  <br>
		  <br>

             <form action="checklogin.jsp">
                 <table>
                     <tr>
                         <td> Username  : </td><td> <input name="username" size=15 type="text" /> </td> 
                     </tr>
                     <tr>
                         <td> Password  : </td><td> <input name="password" size=15 type="text" /> </td> 
                     </tr>
                 </table>
                 <input type="submit" value="login" />
             </form>
 
   </body>
 </html>
