<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
	<head>
		<title>logIn</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/static/css/style.css">
	</head>
		<body  background ="/resources/static/images/2.jpg"/>
        <div class="header">
            <a href="#default" class="logo"><img src="/resources/static/images/logo.png" class="logo"alt="logo"></a>
            <div class="header-right">
              <a class="button" href="/">Home</a>
              <a class="button" href="#contact">Contact</a>
              <a class="button" href="#about">About</a>
              <div class="login-button">
                    <a class="button" href="/loginPage">Login</a>
              </div>
           
            </div>
          </div>
        
        <section class="section"> 
        
          <form:form id="loginPage" action="loginUser" method="post" modelAttribute="user">
                        <div class="login-panel">   
                            <div class="login-logo"><img src="/resources/static/images/logo.png" alt="logo"  ></div>        
                            <div class="login">
                                <h1>Login</h1>
                                
                             <input type="text" placeholder="username" name="email"><br>
                             <input type="password" placeholder="password" name="password"><br>
                             <input type="submit" value="Login"><br>
                             <div class="links">
                                <p><a href="#">Forgot Password?</a></p>  
                                <p ><a href="regForm">New User?Register</a></p>
                                
                              </form:form>
                              <div style="color: red">${error}</div>
                            </div>
                            </div>
        
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
