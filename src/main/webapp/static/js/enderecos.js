$(document).ready(function(){
	aplicarListeners();
	aplicarListenersBtnSalvar();
});

	var limparModal = function(){
		$('#id').val('');
		$('#logradouro').val('');
		$('#cep').val('');
		$('#numero').val('');
		$('#bairro').val('');
		$('#cidade').val('');
		$('#categoria').val('');			
	};

	var aplicarListenersBtnSalvar = function(){
		
		$('#btn-salvar').on('click', function(){
			var url = 'enderecos';
			var dadosEndereco = $('#form-endereco').serialize();
			
			$.post(url, dadosEndereco)
				.done(function(pagina){
					$('#secao-enderecos').html(pagina);
				})
				.fail(function(){
					alert('Erro ao salvar!');
				})
				.always(function(){
					$('#modal-endereco').modal('hide');
				});
		});
		
	}

	var aplicarListeners = function(){
		
		$('#modal-endereco').on('hide.bs.modal', limparModal);
		
		$('.btn-editar').on('click', function(){
			var id = $(this).parents('tr').data('id');
			var url = 'enderecos/'+id;
			
			$.get(url)
				.success(function(endereco){
					$('#id').val(endereco.id);
					$('#logradouro').val(endereco.logradouro);
					$('#cep').val(endereco.cep);
					$('#numero').val(endereco.numero);
					$('#bairro').val(endereco.bairro);
					$('#cidade').val(endereco.cidade);
					$('#categoria').val(endereco.categoria);		
					
					$('#modal-endereco').modal('show');
			});
		});
		
		$('.btn-deletar').on('click', function(){
			var id = $(this).parents('tr').data('id');
			
			$.ajax({
				url : "enderecos/"+id,
				type: 'DELETE',
				success: function(result) {
					$('tr[data-id="'+id+'"]').remove();
					var enderecos = parseInt( $('#quantidade-enderecos').text() );					
					$('#quantidade-enderecos').text(enderecos - 1);
				}
			});
		});
		
	}