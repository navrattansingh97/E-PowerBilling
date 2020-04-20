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
            <div class="header-right">
             <c:url var="logedInHomeLink" value="logedInHome">
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
          <div class="table">
             
<table class="tg" style="undefined;table-layout: fixed; width: 824px">
    <colgroup>
    <col style="width: 199.010417px">
    <col style="width: 26.010417px">
    <col style="width: 284.010417px">
    <col style="width: 112.010417px">
    <col style="width: 203.010417px">
    </colgroup>
      <tr>
        <th class="tg-re61"><span style="font-weight:bold">Name</span></th>
        <th class="tg-re61"><span style="font-weight:bold">:</span></th>
        <th class="tg-re61"><span style="text-decoration:underline">${ user.firstName } ${user.lastName }</span></th>
        <th class="tg-fkgn"></th>
        <th class="tg-re61"><span style="font-weight:bold">Generated On :</span></th>
      </tr>
      <tr>
        <td class="tg-re61"><span style="font-weight:bold">User Id</span></td>
        <td class="tg-re61"><span style="font-weight:bold">:</span></td>
        <td class="tg-re61">${user.email }</td>
        <td class="tg-fkgn"></td>
        <td class="tg-1ch8">${userBill. generationDate }</td>
      </tr>
      <tr>
        <td class="tg-re61"><span style="font-weight:bold">Connection Id</span></td>
        <td class="tg-re61"><span style="font-weight:bold">:</span></td>
        <td class="tg-pwyl"> ${conection.connectionId } </td>
        <td class="tg-fkgn"></td>
        <td class="tg-re61"><span style="font-weight:bold">Submit Till :</span></td>
      </tr>
      <tr>
        <td class="tg-re61"><span style="font-weight:bold">Bill Id</span></td>
        <td class="tg-re61"><span style="font-weight:bold">:</span></td>
        <td class="tg-re61">${userBill.billId }</td>
        <td class="tg-fkgn"></td>
        <td class="tg-xdm0">${userBill.dueDate }</td>
      </tr>
      <tr>
        <td class="tg-43h1"></td>
        <td class="tg-nu5p"></td>
        <td class="tg-nu5p"></td>
        <td class="tg-nu5p"></td>
        <td class="tg-nu5p"></td>
      </tr>
      <tr>
        <td class="tg-8pbb">Consumed Unit</td>
        <td class="tg-8pbb">:</td>
        <td class="tg-oe15"></td>
        <td class="tg-gcaq">${userBill.consumedUnits }</td>
        <td class="tg-8pbb">units</td>
      </tr>
      <tr>
        <td class="tg-8pbb">Unit Charges</td>
        <td class="tg-8pbb">:</td>
        <td class="tg-oe15"></td>
        <td class="tg-gcaq">10</td>
        <td class="tg-8pbb">per unit</td>
      </tr>
      <tr>
        <td class="tg-8pbb">Bill Amount</td>
        <td class="tg-8pbb">:</td>
        <td class="tg-oe15"></td>
        <td class="tg-gcaq">${userBill.billAmount }</td>
        <td class="tg-8pbb">/-Rs</td>
      </tr>
      <tr>
        <td class="tg-8pbb">Tax</td>
        <td class="tg-8pbb">:</td>
        <td class="tg-oe15"></td>
        <td class="tg-gcaq"><%int tax = 200;%>${ tax }</td>
        <td class="tg-8pbb">/-Rs</td>
      </tr>
      <tr>
        <td class="tg-8pbb">Status</td>
        <td class="tg-8pbb">:</td>
        <td class="tg-oe15"></td>
        <td class="tg-oe15"></td>
        <td class="tg-j5ev"><span style="font-weight:bold;text-decoration:underline"> ${userBill.status} </span></td>
      </tr>
      <tr>
        <td class="tg-8pbb">Total Amount</td>
        <td class="tg-8pbb">:</td>
        <td class="tg-oe15"></td>
        <td class="tg-7sih">${userBill.billAmount}</td>
        
        <td class="tg-tmr0">/-Rs</td>
      </tr>
    </table> 
             
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