<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<script src="/stock-web/js/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" href="/stock-web/css/bootstrap.min.css">
	<link rel="stylesheet" href="/stock-web/css/bootstrap-theme.min.css">
	<script src="/stock-web/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>

<h1>Login</h1>

<c:out value="${requestScope.message}"/>
<FORM action="/stock-web/sec/ServletLogin" method="post">
<TABLE>

	<TR>
		<TD>Usuário:</TD>
		<TD><INPUT type="text" name="username"></TD>
	</TR>
	<TR>
		<TD>Senha:</TD>
		<TD><iNPUT type="password" name="password"></TD>
	</TR>
	<TR>
		<TD colspan="2">
			<button class="btn-success" type="submit" >Sign in</button>
		</TD>
	</TR>

</TABLE>
</FORM>
</body>
</html>