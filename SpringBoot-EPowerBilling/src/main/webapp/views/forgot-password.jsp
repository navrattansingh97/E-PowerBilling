<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Welcome To E-power Billing</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="<c:url value="/resources/css/style.css" />"
 rel="stylesheet">
	</head>
		<body background="/resources/static/images/2.jpg"/>
        <div class="header">
            <a href="#default" class="logo"><img src="<c:url value="/resources/images/logo.png"/>" class="logo"alt="logo"></a>
            <div class="header-right">
              <a class="button" href="HomePage">Home</a>
              <a class="button" href="ContactPage">Contacts</a>
              <a class="button" href="AboutPage">AboutUs</a>
              <div class="login-button">
                    <a class="button" href="loginPage">Login</a>
              </div>
           
            </div>
          </div>
        
        <section class="sectionimg"> 
         <h1>ForgotPasswordPage</h1>
         
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

</body>
</html>