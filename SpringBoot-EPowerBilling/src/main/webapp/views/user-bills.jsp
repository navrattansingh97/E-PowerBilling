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
        
        <section class="section"> 
                   
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
								<c:param name="mobNumber" value="${user.mobNumber}" />
								<c:param name="addressLine1" value="${user.address.addressLine1}" />
								<c:param name="addressLine2" value="${user.address.addressLine2}" />
								<c:param name="city" value="${user.address.city}" />
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
          <div class="table">
               <hr>
    <h1>Bill List List</h1>
    <hr>
    <!-- <a href="/new">Create New Product</a> -->
    <br/><br/>
    <table border="1" cellpadding="10" style="color:white;">
        <thead>
            <tr>
           
                <th>Bill ID</th>
                <th>Consumed Units</th>
                <th>Generated On</th>
                <th>Submitted On</th>
                <th>Due Date</th>
                <th>Bill Amount</th>
                <th>Bill Status</th>
            
            </tr>
        </thead>
        <tbody>
        <c:forEach var="bill" items="${billList}">s
        
        
            <tr>
               
                <td>${bill.billId}</td>
                <td>${bill.consumedUnits}</td>
                 <td>${bill.generationDate}</td>
                <td>${bill.submitDate}</td>
                <td>${bill.dueDate}</td>
                <td>${bill.billAmount}</td>
                <td>${bill.status}</td>
               
        
        
            </tr>
             </c:forEach>
        </tbody>
    </table>
</div>   
        <footer>
         <!-- copyright -->
		<div class="copyright">
                <p>© 2020 E-PowerBilling @ NIIT Technologies . All rights reserved | Design by : Run Time Terror</p>
            </div>
            <!-- //copyright --> >
        </footer>
        
        </body>
</html>