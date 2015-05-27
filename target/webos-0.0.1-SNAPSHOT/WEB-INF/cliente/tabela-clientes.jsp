<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<table
	class="table table-hover table-condensed table-striped table-bordered">
	<thead>
		<tr>
			<td style="width: 40%">Nome</td>
			<td style="width: 20%">Informação</td>
			<td style="width: 8%">Data Cadastro</td>
			<td style="width: 16%">Endereços</td>
			<td style="width: 8%">Editar</td>
			<td style="width: 8%">Deletar</td>
		</tr>
	</thead>

	<tbody>
		<c:forEach items="${clientes}" var="cliente">

			<tr data-id="${cliente.id}">
				<td>${cliente.nome}</td>
				<td>${cliente.detalhe}</td>
				<td>
				<fmt:formatDate type="date" value="${cliente.data}"/>
				</td>
				<td>
				<c:forEach items="${cliente.enderecos}" var="endereco">
					${endereco.bairro}</br>
				</c:forEach>
				</td>
				<td><button type="button" class="btn btn-warning btn-editar">Editar</button></td>
				<td><button type="button" class="btn btn-danger btn-deletar">Deletar</button></td>
			</tr>

		</c:forEach>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</tbody>

	<tfoot>
		<tr>
			<td colspan="6">Clientes cadastrados: <span id="quantidade-clientes">${clientes.size()}</span></td>
		</tr>
		<tr>
			<td colspan="6">
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#modal-cliente">Cadastrar cliente</button>
			</td>
		</tr>
	</tfoot>
</table>