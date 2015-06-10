$(document).ready(function(){
	aplicarListeners();
	aplicarListenerBtnSalvar();
});

var limparModal = function(){
	$('#id').val('');
	$('#nome').val('');
	$('#detalhe').val('');
	$('#data').val('');
	$('#enderecos option').attr('selected', false);	
};


var aplicarListenerBtnSalvar = function(){
	
	$('#btn-salvar').on('click', function(){
		var url = 'clientes';
		var dadosCliente = $('#form-cliente').serialize();
		
		$.post(url, dadosCliente)
			.done(function(pagina){
				$('#secao-clientes').html(pagina);
				aplicarListeners();
			})
			.fail(function(){
				alert('Erro ao salvar!');
			})
			.always(function(){
				$('#modal-cliente').modal('hide');
			});
	});
}

var aplicarListeners = function(){
	
	$('#modal-cliente').on('hide.bs.modal', limparModal);
	
	$('.btn-deletar').on('click', function(){
		var clienteId = $(this).parents('tr').data('id');
		
		$.ajax({
			url : 'clientes/'+clienteId,
			type: 'DELETE',
			success: function(result) {
				$('tr[data-id="'+clienteId+'"]').remove();
				var clientes = parseInt( $('#quantidade-clientes').text() );				
				$('#quantidade-clientes').text(clientes - 1);
			}
		});
		
	});
	
	
	$('.btn-editar').on('click', function(){
		var clienteId = $(this).parents('tr').data('id');
		var url = 'clientes/'+clienteId;
		
		$.get(url)
			.success(function(cliente){
				$('#id').val(cliente.id);
				$('#nome').val(cliente.nome);
				$('#detalhe').val(cliente.detalhe);
				$('#data').val(cliente.data);
				cliente.enderecos.forEach(function(enderecos){
						var id = enderecos.id;
						$('#enderecos option[value='+id+']').attr('selected', true);
				});
				
				$('#enderecos').val(cliente.enderecos);
				
				$('#modal-cliente').modal('show');
		});
	});
		
	}