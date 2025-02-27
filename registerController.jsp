<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="java.lang.*" %>
<%@ page import="KTEL.*" %>

<% 

/*
* Getting parameters from request.
*/

String email = request.getParameter("email");
String username = request.getParameter("username");
String passw = request.getParameter("password");
String confp = request.getParameter("confpassword");

/*
 * If page is called directly (from url) and not via register.jsp then all parameters will be null.
 * (In that case error.jsp will respond)
 */
if ( email == null && username == null && passw == null && confp == null) {

    throw new Exception("You have not been registered yet, please visit <a href='register.jsp'>registration page</a>.");

}

int countErrors = 0;

/*
* Validating email address
* Reference: https://stackoverflow.com/questions/624581/what-is-the-best-java-email-address-validation-method
*/
String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
java.util.regex.Matcher m = p.matcher(email);

if( !m.matches() ) {				
    countErrors++;
}

if (username == null || username.length() <= 5) {
    countErrors++;
}

if (passw == null || passw.length() <= 6) {
    countErrors++;
}

if (confp == null || !confp.equals(passw)) {
    countErrors++;
}

/*
* If there is an error in form data, then add an attribute (with name errorMessage) to request and forward to register.jsp.
*/
if (countErrors > 0) {
    request.setAttribute("errorMessage", "Form has " + (countErrors == 1 ? "1 error!" : countErrors + " errors!"));
%>
    <jsp:forward page="register.jsp"/>
<%
    return;  
} 

Accounts account = new Accounts(username, passw, email);

AccountsDAO aDAO = new AccountsDAO();

try {

    aDAO.insertAccount(account);
    session.setAttribute("userObj2024", account); 

} catch(DuplicateFieldException e) {

    // Case Username already exists (must be unique among users) then add errorMessage to request and forward to register.jsp
    request.setAttribute("errorMessage", e.getMessage());    

%>
    <jsp:forward page="register.jsp"/>
<%
    return;    
} catch(Exception e) {
    // In case of other error, error.jsp will handle it
    throw new Exception(e.getMessage()); 
}

request.setAttribute("successMessage", "You have been registered successfully!");
%>
<jsp:forward page="Search1.jsp"/>
