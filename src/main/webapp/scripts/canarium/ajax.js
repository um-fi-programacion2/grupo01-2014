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

	$("body").on("click","#botonsito", function(event){
		var descripcion = $("#_descripcion_id").val();
		var url = "mensajes/";	
		//var data = JSON.stringify({"descripcion":descripcion,"id":null,"persona":{"contentType":"image/png","descripcion":"12","fecha":1423796400000,"id":5,"image":null,"path":"/home/federico/software/jboos-6-3/bin/Sinnombre.png","persona":{"activationDate":1423871942000,"activationKey":"activationKey:1253955607","emailAddress":"fede.becerra@gmail.com","enabled":true,"firstName":"federico","id":3,"lastName":"baigorria","locked":false,"password":"6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b","persona":null,"version":1},"seguidores":null,"sexo":"masculino","siguiendo":null,"usuario":"baigorriafeder","version":8},"version":0});
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
				alert(data);
			}
		});
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