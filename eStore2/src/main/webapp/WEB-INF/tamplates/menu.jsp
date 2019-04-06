<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header>
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="#">Carousel</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="<c:url value="/"/>">Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="/products"/>">Products</a></li>
				<%-- <li class="nav-item"><a class="nav-link"
					href="<c:url value="/admin"/>">Admin</a></li> --%>

				<c:if test="${pageContext.request.userPrincipal.name !=null }">
					<c:if test="${pageContext.request.userPrincipal.name =='admin'}"> 
					<!-- id가 뭐냐에 따라서 나오고 안나오고의 차이다. admin 으로 로그인하면 나오고 kozi는 안나옴..ㅠㅠ -->
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/admin"/>">AdminPage</a></li>
					</c:if>

					<li class="nav-item"><a class="nav-link"
						href="javascript:document.getElementById('logout').submit()">Logout</a></li>
					<!-- 위의 로그아웃을 선택하면 logout이란 id를 가진 아래 를 logout url+ post로 서버로 보내버린다. -->
					<form id="logout" action="<c:url value="/logout" />" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>

				</c:if>

				<c:if test="${pageContext.request.userPrincipal.name == null}">
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/login"/>">Login</a></li>
				</c:if>

			</ul>
			<form class="form-inline mt-2 mt-md-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
</header>