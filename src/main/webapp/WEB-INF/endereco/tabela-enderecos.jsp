<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<table
	class="table table-hover table-condensed table-striped table-bordered">
	<thead>
		<tr>
			<td style="width: 10%">Bairro</td>
			<td style="width: 50%">Rua</td>
			<td style="width: 20%">Número</td>
			<td style="width: 10%">Editar</td>
			<td style="width: 10%">Deletar</td>
		</tr>
	</thead>

	<tbody>
		<c:forEach items="${enderecos}" var="endereco">

			<tr data-id="${endereco.id}">
				<td>${endereco.bairro}</td>
				<td>${endereco.logradouro}</td>
				<td>${endereco.numero}</td>
				<td><button type="button" class="btn btn-warning btn-editar">Editar</button></td>
				<td><button type="button" class="btn btn-danger btn-deletar">Deletar</button></td>
			</tr>

		</c:forEach>
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</tbody>

	<tfoot>
		<tr>
			<td colspan="5">Endereços cadastrados: <span id="quantidade-enderecos">${enderecos.size()}</span></td>
		</tr>
		<tr>
			<td colspan="5">
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#modal-endereco">Cadastrar endereço</button>
			</td>
		</tr>
	</tfoot>
</table>