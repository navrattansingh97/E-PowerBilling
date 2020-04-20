<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User Details</title>
</head>
	<body background="/resources/static/images/2.jpg"/>
<div align="center">
        <h1>Update User Details</h1>
        <br />
         <form:form id="userform" action="/save" method="post" modelAttribute="user">
        
 
            <table border="0" cellpadding="10">
                <tr>             
                    <td>User ID:</td>
                    <td>
                        <input type="number" name="uId" value=${user.uId} readonly="readonly" />
                    </td>
                </tr>        
                <tr>             
                    <td>User First Name:</td>
                    <td>
                        <input type="text" name="firstName" value=${user.firstName} >
                    </td>
                </tr>
                <tr>             
                    <td>User Last Name:</td>
                    <td>
                        <input type="text" name="lastName" value=${user.lastName} >
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name="email" value=${user.email}></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password" value=${user.password}></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><input type="text" name="gender" value=${user.gender}></td>
                </tr>
                <tr>
                    <td>Aadhar Number</td>
                    <td><input type="text" name="aadhaar" value=${user.aadhaar} ></td>
                </tr>
                <tr>
                    <td>Mobile Number:</td>
                    <td><input type="text" name="mobNumber" value=${user.mobNumber}></td>
                </tr> 
                 <tr>
                    <td>Status:</td>
                    <td><input type="text" name="status" value=${user.status}></td>
                </tr>                            
                <tr>
                    <td colspan="2"><button type="submit">Save</button> </td>
                </tr>
            </table>
       </form:form>
    </div>
</body>
</html>