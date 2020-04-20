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
              <a class="button" href="/admin">Home</a>
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
                <h1 style="color:white;"><strong>Hi Admin ! ${user.firstName}</strong><br>Account Number: ${user.email}<br />
                Mob: ${user.mobNumber }<br />
                Address: ${user.address.addressLine1}<br>
                ${user.address.addressLine2}<br>
                ${user.address.city} 
                </h1>
            </div>
          </nav>
           <div class="menu">
            <a class="button" href="billDetails">Update Bill Details</a>&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <a class="button" href="connDetails">Update Connection Details</a>&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <a class="button" href="#about">Change Password</a>
          </div>
        </section>
        <div align="center">


<!-- <div align="right" style="color:white;"><a href="logout">Log Out<%out.print(request.getSession().getAttribute("user")); %></a></div> -->
   <hr>
    <h1>User List</h1>
    <hr>
    <!-- <a href="/new">Create New Product</a> -->
    <br/><br/>
    <table border="1" cellpadding="10" style="color:white;">
        <thead>
            <tr>
                <th>User ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Gender</th>
                <th>Aadhar Number</th>
                <th>Email</th>
                <th>Password</th>
                <th>Mobile No.</th>
            
            </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${listUser}">
        
         <!-- construct an "update" link with user id -->
							<c:url var="updateLink" value="/edit">
								<c:param name="id" value="${user.uId}" />
							</c:url>

							<!-- construct an "delete" link with customer id -->
							<c:url var="deleteLink" value="/delete">
								<c:param name="id" value="${user.uId}" />
							</c:url>
        
            <tr>
                <td>${user.uId}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.gender}</td>
                 <td>${user.aadhaar}</td>
                <td>${user.email}</td>
                <td>${user.password}</td>
                <td>${user.mobNumber}</td>
                <td>
                   	<!-- display the update link --> 
									<a href="${updateLink}">Update</a>
									| <a href="${deleteLink}"
									onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                </td>
               
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
