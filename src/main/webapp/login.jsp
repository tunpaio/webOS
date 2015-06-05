<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WebOs - Login</title>
<c:set var="path" value="${pageContext.request.contextPath}" scope="request"/>
<style type="text/css">
	@IMPORT url("${path}/static/bootstrap/css/bootstrap.min.css");
	@IMPORT url("${path}/static/bootstrap/css/bootstrap-theme.min.css");
	
	#login{
		width: 400px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 100px; 
	}

	#btn-login{
		width: 100%;
	}
	
</style>
</head>
<body>
	<section id="login" class="panel panel-primary">
	
		<c:if test='${not empty param["semacesso"]}'>
			<div class="alert alert-warning">
				Usuário e/ou senha incorretos!
			</div>
		</c:if>
		
		<c:if test='${not empty param["saiu"]}'>
			<div class="alert alert-info">
				Você saiu.
			</div>
		</c:if>
	
		<form action="${path}/autenticar" method="post">
		
			<div class="panel-heading">
				WebOs - Login
			</div>
			
			<div class="panel-body">
			
				<label for="usuario"></label>
				<input id="usuario" name="usuario" class="form-control" required>
				
				<label for="senha"></label>
				<input type="password" id="senha" name="senha" class="form-control" required>
				
			</div>
			
			<div class="panel-footer">
				
				<button id="btn-login" class="btn btn-primary">Entrar</button>
				
			</div>
			
			<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"> 
			
		</form>
	
	</section>

	<script type="text/javascript" src="${path}/static/js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>