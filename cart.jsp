<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty cart}">
		<h1>View Cart</h1>
		<hr>
		<c:forEach var="bookInCart" items="${cart.values()}">
		${bookInCart.book.name} - ${bookInCart.quanity}
		<br>
		</c:forEach>
	</c:if>

	<c:if test="${empty cart}">
		<h2>Empty Cart</h2>
	</c:if>
	<br>
	<br>
	<a href="home">Back to Home Page</a>
</body>
</html>