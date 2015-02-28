$(document).ready(function(){
	
	/*$("body").on("click",".botonAjax", function(event){
		var id = $(this).data("objid");
		var autor = $(this).data("user");
		var url = "../mensajes/"+id;
		$.ajax({
			type:'GET',
			headers: {Accept: 'application/json'},
			url: url,
			data: {},
			success: function(data) {
				$("#campoId").html(data.id); //id Span
				$("#formId").val(data.id); //Input Type
				$("#formContenido").val(data.contenido);
				$("#formAutor").val(data.autor);  //input Type
				$("#campoVersion").html(data.version);
				$("#formVersion").val(data.version);
				//$("#contenedorFormulario").show();
			}
		});
	});*/
	
	/*$("body").on("click","#botonsito", function(event){
		var contenido = $("#_descripcion_id").val();
		alert(contenido);
		
	});*/

	/*$("body").on("click","#botonBorrarFormulario", function(event){
		$("#campoId").html("");
		$("#formId").val("");
		$("#formContenido").val("");
		$("#formAutor").val("");
		$("#campoVersion").html("");
		$("#formVersion").val("");
		
	});
	
	$("body").on("click","#botonAjaxBorrar", function(event){
		var id = $(this).data("objid");
		var url = "../mensajes/"+id;
		$.ajax({
			type:'DELETE',
			headers: {Accept: 'application/json'},
			url: url,
			data: {},
			success: function() {},
			complete: function() {
				cargarLista();
			}
		});
	});

	$("body").on("click","#botonAjaxAgregar", function(event){
		var contenido = $("#formContenido").val();
		var url = "../mensajes/";	
		var data = JSON.stringify({contenido:contenido});
		$.ajax({
			type:'POST',
			contentType: 'application/json',
			headers: {Accept: 'application/json'},
			url: url,
			data: data,
			success: function() {},
			complete: function() {
				cargarLista();
			}
		});
	});*/
	
	$("body").on("click","#botonBorrar", function(event){
		var id = $(this).data("id");
		var url = "mensajes/"+id;
		$.ajax({
			type:'DELETE',
			headers: {Accept: 'application/json'},
			url: url,
			data: {},
			success: function() {},
			complete: function() {
				cargarMensajes();
			}
		});
	});

	$("body").on("click","#crear_mensaje", function(event){
		var descripcion = $("#_descripcion_id").val();
		var url = "mensajes/";	
		var data = JSON.stringify({"descripcion":descripcion});
		$.ajax({
			type:'POST',
			contentType: 'application/json',
			headers: {Accept: 'application/json'},
			url: url,
			data: data,
			success: function() {},
			complete: function() {
				$("#_descripcion_id").val("");
				cargarMensajes()
			}
		});
	});
	
	function cargarMensajes(){
		var logueado = $("#logueada_id").val();
		var url = "mensajes/";
		$.ajax({
			type:'GET',
			headers: {Accept: 'application/json'},
			url: url,
			data: {},
			success: function(data) {
				var datoHTML = "";
				$.each(data, function(i, val){
					datoHTML += 
						"<div class='cuenta mensajes'>"+
							"<div class='informacion_cuenta'>"+
								"<div class='contenido_cuenta lista'>"+
									"<a href='/canarium/personae/"+val.persona.id+"'>"+
										"<img class='avatar size48' src='http://localhost:8080/canarium/personae/"+val.persona.id+"/image' />"+ 
										"<b	class='nombre_completo'>"+val.persona.persona.firstName+" "+val.persona.persona.lastName+"</b>"+
									"</a>"+
										val.descripcion+
									"<div class='lista-acciones'>";
										if(logueado != val.persona.id){
										datoHTML += 
										"<div class='accion-republicar'>"+
											"<a href='#' title='Republicar'>"+
												"<span class='glyphicon glyphicon-retweet' aria-hidden='true'></span>"+
											"</a>"+
										"</div>";
										}else{
										datoHTML +=
										"<div class='accion-editar'>"+
											"<a href='#' title='Editar'>"+
												"<span class='glyphicon glyphicon-edit' aria-hidden='true'></span>"+
											"</a>"+
										"</div>"+
										"<div class='accion-borrar'>"+
											"<a href='#' title='Borrar' id='botonBorrar' data-id='"+val.id+"'>"+
												"<span class='glyphicon glyphicon-trash' aria-hidden='true'></span>"+
											"</a>"+
										"</div>";
										}
									datoHTML +=
									"</div>"+
								"</div>"+
							"</div>"+
						"</div>";
				});
				$("#muro_mensajes").html(datoHTML);
			}
		});
		
		//$("#muro_mensajes").html("<div>Hola</div>");
	};
	
	$(document).ready(function(){
		cargarMensajes();
	});

	
	/*$("body").on("click","#botonAjaxEditar", function(event){
		var id = $("#formId").val();
		var contenido = $("#formContenido").val();
		var version = $("#formVersion").val();
		var url = "../mensajes/"+id;
		var data = JSON.stringify(data = {id: id, contenido:contenido, version: version});
		$.ajax({
			type:'PUT',
			headers: {Accept: 'application/json'},
			url: url,
			data: data,
			success: function() {},
			complete: function() {
				cargarLista();
			}
		});
	});		
	
	$(document).ready(function(){
		cargarLista();
	});

	
	function cargarLista(){
		var id = $(this).data("objid");
		var url = "../mensajes";
		$.ajax({
			type:'GET',
			headers: {Accept: 'application/json'},
			url: url,
			data: {},
			success: function(data) {
				var datoHTML = "<tr><td>Contenido</td><td>Autor</td><td>Borrar</td><td>Detalles</td></tr>";
				$.each(data, function(i, val){
					datoHTML += "<tr>" +
											"<td>"+val.contenido+"</td>" +
											"<td>"+val.autor.userName+"</td>" +
											"<td>"+val.id+"</td>" +
											"<td><div id='botonAjaxBorrar' class='btn btn-danger' data-objid='"+val.id+"'>Borrar</div></td>" +
											"<td><div class='botonAjax' data-objid='"+val.id+"'>Ver</div></td>" +
											"<td><div id='botonAjaxEditar' data-objid='"+val.id+"'>Editar</div></td>" +
										"</tr>";

				});
				$("#contenidoTabla").html(datoHTML);
			}
		});
	}*/
});