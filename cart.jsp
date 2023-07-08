<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="coding.mentor.entity.BookInCart"%>
<%@page import="java.util.HashMap"%>
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
			<p>Book Name: ${bookInCart.book.name} - Price:
				${bookInCart.book.price} - Quantity: ${bookInCart.quantity}</p>
			<br>
		</c:forEach>
	</c:if>
	<c:set var="totalQuantity" value="0" />
	<c:set var="totalPrice" value="0" />
	<c:if test="${not empty cart}">
		<c:forEach var="bookInCart" items="${cart.values()}">
			<c:set var="quantity" value="${bookInCart.quantity}" />
			<c:set var="totalQuantity" value="${totalQuantity + quantity}" />
			<c:set var="totalPrice"
				value="${totalPrice + (bookInCart.book.price * quantity)}" />
		</c:forEach>
	</c:if>

	<c:if test="${empty cart}">
		<h2>Empty Cart</h2>
	</c:if>
	<p>Total quantity: ${totalQuantity}</p>
	<p>Total price: ${totalPrice}</p>

	<c:set var="totalQuantity" value="${totalQuantity}" scope="session" />
	<c:redirect url="home.jsp" />
	<br>
	<br>
	<a href="home">Back to Home Page</a>
</body>
</html>