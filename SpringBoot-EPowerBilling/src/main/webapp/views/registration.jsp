 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Registration</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/resources/static/css/style.css">
	</head>
		<body background="/resources/static/images/2.jpg"/>
        <div class="header">
            <a href="#default" class="logo"><img src="/resources/static/images/logo.png" class="logo"alt="logo"></a>
         	  <div class="header-right">
              <a class="button" href="HomePage">Home</a>
              <a class="button" href="ContactPage">Contact</a>
              <a class="button" href="AboutPage">About</a>
              <div class="login-button">
                    <a class="button" href="loginPage">Login</a>
              </div>
           
            </div>
          </div>
        <section class="section"> 
                
                        <div class="Registration-panel"> 
                                <div class="register-heading"><h1>Register:- </h1></div>  
                           
                               <form:form id="regForm" action="saveUser" method="post" modelAttribute="user">
                                
                         
                                        <div class="input_field"> <i aria-hidden="true" class="fa fa-envelope icon"></i>
                                        <input type="email" name="email" placeholder="Email" required />
                                       
            
            
                                        </div>
                                        <div class="input_field"> <span><i aria-hidden="true" class="fa fa-lock icon"></i></span>
                                        <input type="password" name="password" placeholder="Password" required />
                                        </div>
            
            
                                        <div class="input_field"> <span><i aria-hidden="true" class="fa fa-lock icon"></i></span>
                                        <input type="password" name="confirmPassword" placeholder="Re-type Password" required />
                                        </div><br>
            
            
                                        <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user icon"></i></span>
                                        <input type="text" name="firstName" placeholder="First Name" />
                                        </div><br>
                                        
            
                                        <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user icon"></i></span>
                                        <input type="text" name="lastName" placeholder="Last Name" required />
                                        </div><br>
            
                                        
                                        <div class="input_field radio_option">
                                          <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user icon"></i></span>
                                        <input type="radio" name="gender" id="rd1" value="male">
                                        <label for="rd1">Male</label>
                                        <input type="radio" name="gender" id="rd2" value="female">
                                        <label for="rd2">Female</label>
                                        </div><br>


                                      
            
                                        <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user icon"></i></span>
                                          <input type="text" name="mobNumber" placeholder="Mobile Number" />
                                          </div><br>


                                        <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user icon"></i></span>
                                          <input type="text" name="aadhaar" placeholder="Aadhaar Number" required />
                                          </div><br>



                                          <!--Address-->
                                        <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user icon"></i></span>
                                          <input type="text" name="addressLine1" placeholder="Address Line1" required />
                                          </div><br>

                                          <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user icon"></i></span>
                                            <input type="text" name="addressLine2" placeholder="Address Line2" />
                                            </div><br>

                                            
                                          <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user icon"></i></span>
                                            <input type="text" name="city" placeholder="City" required />
                                            </div><br>

                                            <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user icon"></i></span>
                                              <input type="text" name="pincode" placeholder="Pin Code" required />
                                              </div><br>
                                          

                                            <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user icon"></i></span>
                                              <input type="text" name="country" placeholder="Country" required />
                                              </div><br>
                                        <div class="input_field_select_option">
                                          <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user icon"></i></span>
                                        <select name="state">
                                        <option>Select your State</option>
                                        <option>Delhi</option>
                                        <option>Haryana</option>
                                        <option>UttarPradesh</option>
                                        <option>MadhyaPradesh</option>
                                        </select>
                                        <div class="select_arrow"></div>
                                        </div>
                                        <input id="submit" type="submit" name="submit" value="Register"><br>
                                                                        </form:form>
                                
                        
        
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
