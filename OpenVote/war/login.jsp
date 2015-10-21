<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
  </head>
  
  <body>
      <form action="checklogin.jsp">
          <table>
              <tr>
                  <td> Username  : </td><td> <input name="name" size=15 type="text" /> </td> 
              </tr>
              <tr>
                  <td> Password  : </td><td> <input name="password" size=15 type="password" /> </td> 
              </tr>
          </table>
          <input type="submit" value="login" />
      </form>
   </body>
 </html>
