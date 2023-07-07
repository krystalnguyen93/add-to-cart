<%@page import="coding.mentor.entity.Category"%>
<%@page import="coding.mentor.service.CategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
}

.sub-body-category {
	float: left;
	width: 20%;
	padding: 10px;
}

.sub-body-product {
	float: left;
	width: 80%;
	padding: 10px;
}

.body:after {
	content: "";
	display: table;
	clear: both;
}
</style>
</head>
<body>
	<%-- <ul>
<%
String[] arr = {"Coffee", "Tea", "Milk"};
for (String s : arr){
	out.println("<li>" + s + "</li>");
}
%>
</ul>
<hr>
<nav class="category-menu">
<ul>
<%
CategoryService categoryService = new CategoryService();
for (Category category : categoryService.getAllCategories()) {
	out.println("<a href='book-list.jsp?categoryId=" + category.getId() + "'><li>" + category.getName() + "</li></a>");
}
%>
</ul>
</nav> 
 --%>

	<c:if test="${empty username}">
		<a href="login.jsp">Log in / Register</a>
	</c:if>

	<c:if test="${not empty username}">
		<p>Hi ${username}</p>
		<a href="#">Profile</a>
		<br>
		<a href="#">Change password</a>
		<br>
		<a href="#">Log out</a>
		<br>
	</c:if>
	<br>
	<%-- lay so luong book trong cart tu session --%>
	<c:set var="cart" value="${sessionScope.cart}" />

	<%-- Tinh tong so luong book trong cart --%>
	<c:set var="totalQuantity" value="0" />
	<c:if test="${not empty cart}">
		<c:forEach var="bookInCart" items="${cart}">
			<c:set var="totalQuantity"
				value="${totalQuantity + bookInCart.quantity}" />
		</c:forEach>
	</c:if>
	<a href="cart?action=ViewCart">Cart(${totalQuantity})</a>
	<br>
	<div class="header">
		<form action="home">
			<input type="text" name="bookName" value="${bookName}"> <input
				type="submit" value="Search">
		</form>
	</div>
	<hr>
	<div class="body">
		<div class="sub-body-category">
			<ul>
				<c:forEach var="category" items="${categoryList}">
					<a href="home?categoryId=${category.id}">
						<li>${category.name}</li>
					</a>
				</c:forEach>
			</ul>
		</div>
		<div class="sub-body-product">
			<c:if test="${empty bookList}">
	no book
	</c:if>
			<c:if test="${not empty bookList}">
				<ul>
					<c:forEach var="book" items="${bookList}">
						<a href="book?bookId=${book.id}">
							<li>${book.name}</li>
						</a>
					</c:forEach>
				</ul>
			</c:if>
		</div>
	</div>
	<hr>
	<div class="footer">THIS IS CODING MENTOR WEBSITE FOR BE 4</div>
</body>
</html>