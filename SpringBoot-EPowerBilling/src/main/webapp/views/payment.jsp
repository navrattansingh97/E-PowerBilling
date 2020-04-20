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
		    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
  margin-left: 20px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #4CAF50;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>
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
                ${user.address.city} <br>
                bill: ${bill.billId}<br>
                
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
         <form:form id=" paymentPage	" action="savePayment" method="post" modelAttribute="bill">
       
          <div class="row">
            <div class="col-75">
              <div class="container">
                <form action="/action_page.php">
                
                  <div class="row">
                
                    <div class="col-50">
                      <h3>Payment</h3>
                      <label for="fname">Accepted Cards</label>
                      <div class="icon-container">
                        <i class="fa fa-cc-visa" style="color:navy;"></i>
                        <i class="fa fa-cc-amex" style="color:blue;"></i>
                        <i class="fa fa-cc-mastercard" style="color:red;"></i>
                        <i class="fa fa-cc-discover" style="color:orange;"></i>
                      </div>
                       <label for="billId">Bill Id :-</label>
                      <input type="text" id="billId" name="billId" value="${bill.billId}" readonly>
                      <label for="ccnum">Credit card number</label>
                      <label for="cname">Name on Card</label>
                      <input type="text" id="cname" name="cardname" >
                      <label for="ccnum">Credit card number</label>
                      <input type="text" id="ccnum" name="cardnumber" >
                      <label for="expmonth">Exp Month</label>
                      <input type="text" id="expmonth" name="expmonth" >
                      <div class="row">
                        <div class="col-50">
                          <label for="expyear">Exp Year</label>
                          <input type="text" id="expyear" name="expyear" >
                        </div>
                        <div class="col-50">
                          <label for="cvv">CVV</label>
                          <input type="text" id="cvv" name="cvv">
                        </div>
                      </div>
                    </div>
                    
                  </div>
                    <label for="amount">Amount To Be Paid :- </label>
                      <input type="text" id="amount" name="amount" value="${bill.billAmount}" readonly>
                  
                  <input type="submit" value="Continue to checkout" class="btn">
                </form:form>
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