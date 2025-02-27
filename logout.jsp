<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>

<%
session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">
	<head>

        <!-- <link rel="icon" href="images/favicon.ico"> -->
        <link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <!-- Bootstrap Optional theme -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-theme.min.css">
	
		<!-- automatically will redirect to index_ex3_8190156.jsp after 2 seconds -->
		<meta http-equiv="refresh" content="2;url=login.jsp" />
	
		<title>Logout page</title>

        <link href="css/theme_ismgroup29_payment.css" rel="stylesheet">

	</head>
<body>	

	<div class="container theme-showcase" role="main">

		<div class="alert alert-success text-center" role="alert">Η έξοδος πραγματοποιήθηκε με επιτυχία!</div>		

	</div>
	<!-- /container -->

	<%@ include file="footer.jsp" %>
</body>
</html>
