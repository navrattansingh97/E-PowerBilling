<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<title>LogedIn</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/static/css/style.css" />
	</head>
	<body background="/resources/static/images/2.jpg"/>
        <div class="header">
            <a href="#default" class="logo"><img src="/resources/static/images/logo.png" class="logo"alt="logo"></a>
            <div class="header-right">  <c:url var="logedInHomeLink" value="logedInHome">
								<c:param name="email" value="${user.email}" />
								</c:url>
              <a class="button" href="${logedInHomeLink}">Home</a>
              <a class="button" href="#contact">Contact</a>
              <a class="button" href="#about">About</a>
              <div class="login-button">
                    <a class="button" href="logout">Log Out</a>
              </div>
           
            </div>
          </div>
        
        <section class="section" > 
                   
          <nav>
            <div class="user-info">
                <img class="user-image" src="<c:url value="/resources/static/images/user.jpg"/>" alt="User Image" />
                <h1 style="color:white;"><strong>Hi! ${user.firstName}</strong><br>E-Mail: ${user.email}<br />
                ConnectionId: ${conection.connectionId }<br>
                Mob: ${user.mobNumber }<br />
                Address: ${user.address.addressLine1}<br>
                ${user.address.addressLine2}<br>
                ${user.address.city} 
                </h1>
            </div>
            
               <c:url var="billDetailsLink" value="bill-list">
								<c:param name="email" value="${user.email}" />
									<c:param name="conId" value="${conection.connectionId }" />
							</c:url>
							  <c:url var="updatePasswordLink" value="updatePassword">
								<c:param name="email" value="${user.email}" />
								</c:url>
								  <c:url var="paymentPageLink" value="paymentPage">
								<c:param name="email" value="${user.email}" />
								<c:param name="billId" value="${userBill.billId }" />
								</c:url>
          </nav>
           <div class="menu">
            <a class="button" href="${paymentPageLink}">Pay Bill</a>&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <a class="button" href="${billDetailsLink}">Get Bill Details</a>&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <a class="button" href="${updatePasswordLink}">Change Password</a>
          </div>
            
<div align="right" style="color:white;"><a href="logout">Log Out<%out.print(request.getSession().getAttribute("user")); %></a></div>
   <hr>
    
    <hr>
  
    <br/><br/>
      <c:url var="changePasswordLink" value="updatePassword">
								<c:param name="email" value="${user.email}" />
									</c:url> 
      <form:form id=" updatePasswordLink	" action="update-password" method="post" modelAttribute="user1">
                        <div class="login-panel">   
                            <div class="login-logo"><img src="/resources/static/images/logo.png" alt="logo"  ></div>        
                            <div class="login"><br><br>
                            <br>
                                <h1>ChangePassword</h1>
                                <br><br>
                                  <div id="errormsg" style="display:none"></div>
    <div>
   
    	<input id="email" value="${user.email }" name="email" type="hidden"></input>
        <input id="oldpass" placeholder="Current Password" name="oldPassword" type="password" />
        <input id="pass"  placeholder="New Password"name="newPassword" type="password" />
        <input id="passConfirm" placeholder="Confirm Password" type="password" />              
        <span id="error" style="display:none">Password mismatch</span>
         <span id="errormsg" style="display:none"> ${ errormsg }</span>
          <span id="msgr" style="display:none"> ${ msg } </span>
        
        
                         
       <button type="submit" onclick="savePass()">Change Password</button>
    </div>
                                   <script src="jquery.min.js"></script>
    <script type="text/javascript">
     
    var serverContext = [[{}]];
    function savePass(){
        var pass = $("#pass").val();
        var valid = pass == $("#passConfirm").val();
        if(!valid) {
          $("#error").show();
          return;
        }
        $.post(serverContext + "user/updatePassword",
          {password: pass, oldpassword: $("#oldpass").val()} ,function(data){
            window.location.href = serverContext +"/home.html?message="+data.message;
        })
        .fail(function(data) {
            $("#errormsg").show().html(data.responseJSON.message);
        });
    }
    </script> 
                            
                              </form:form>
                              <div style="color: red">${error}</div>
                              
         
   
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
