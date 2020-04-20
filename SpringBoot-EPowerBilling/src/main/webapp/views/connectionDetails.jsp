 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Connection Details</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/resources/static/css/style.css">
	</head>
		<body background="/resources/static/images/2.jpg"/>
        <div class="header">
            <a href="#default" class="logo"><img src="/resources/static/images/logo.png" class="logo"alt="logo"></a>
         	  <div class="header-right">
              <a class="button" href="/">Home</a>
              <a class="button" href="#">Contact</a>
              <a class="button" href="#">About</a>
              <div class="login-button">
                    <a class="button" href="/loginPage">Login</a>
              </div>
           
            </div>
          </div>
        <section class="section" > 
                
                        <div class="Registration-panel"> 
                                <div class="register-heading"><h1>Connection Details:- </h1></div>  
                           
                               <form:form id="regForm" action="saveConn" method="post" modelAttribute="conn">
                                
                         
                                        <div class="input_field"> <i aria-hidden="true" class="fa fa-envelope icon"></i>
                                        <input type="text" name="userId" placeholder="User Id" required />
                                       
            
         
                                        </div>
                                       <!--  <div class="input_field"> <span><i aria-hidden="true" class="fa fa-lock icon"></i></span>
                                        <input type="text" name="connectionId" placeholder="connectionId" required />
                                        </div> -->
            
            
                                        <div class="input_field"> <span><i aria-hidden="true" class="fa fa-lock icon"></i></span>
                                        <input type="text" name="connectionName" placeholder="Connection Name" required />
                                        </div><br>
            
            
                                        <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user icon"></i></span>
                                        <label>Connection Start Date: </label>
                                        <input type="date" name="connectionStartDate" required/>
                                        </div><br>
            
                                        
                                        <div class="input_field radio_option">
                                          <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user icon"></i></span>
                                        <input type="radio" name="connectionType" id="rd1" value="Domestic">
                                        <label for="rd1">Domestic</label>
                                        <input type="radio" name="connectionType" id="rd2" value="Commercial">
                                        <label for="rd2">Commercial</label>
                                        </div><br>


                                      
            
                                        
                                        <input id="submit" type="submit" name="submit" value="Submit"><br>
                                                                        </form:form>
                                
                        <div style="color: red">${error}</div>
        
                        </div>
                    
        
        
          
         
        </section>
        
        <footer>
         <!-- copyright -->
		<div class="copyright">
                <p>© 2020 E-PowerBilling @ NIIT Technologies . All rights reserved | Design by : Run Time Terror</p>
            </div>
            <!-- //copyright --> >
        </footer>
        
        </body>
</html>
