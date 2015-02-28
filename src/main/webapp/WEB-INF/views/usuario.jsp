<input type="hidden" value="${persona.id}" id="logueada_id" />
<div class="bloque">
	<div class="cuenta">
		<a href="/canarium/personae/verPerfil" class="informacion_cuenta">
			<div class="contenido_cuenta">
				<img class="avatar size32" src="http://localhost:8080/canarium/personae/${persona.id}/image" /> 
				<b	class="nombre_completo">${usuario.firstName}
					${usuario.lastName}</b> <small class="perfil_link">Ver mi
					pagina de perfil</small>
			</div>
		</a>
	</div>
	<div>
		<ul class="estado_perfil_caja">
			<li><a class="js-nav" href="#" data-element-term="tweet-stats"
				data-nav="profile"><strong>18</strong>Tweets</a>
			</li>
			<li><a class="js-nav" href="http://localhost:8080/canarium/relacions?find=ByPersona&persona=${persona.id}" data-element-term="tweet-stats"
				data-nav="profile"><strong>${persona.siguiendo}</strong>Siguiendo</a>
			</li>
			<li><a class="js-nav" href="http://localhost:8080/canarium/relacions?find=ByIdSeguidoEquals&idSeguido=${persona.id}" data-element-term="tweet-stats"
				data-nav="profile"><strong>${persona.seguidores}</strong>Seguidores</a>
			</li>
		</ul>
	</div>
	<div class="caja_tweet">
		<jsp:include page="/WEB-INF/views/mensajes/mensaje.jsp" />
	</div>
</div>
<div class="bloque">
	<jsp:include page="/WEB-INF/views/personae/findPersonaeByUsuarioLike.jspx" />
</div>
<div class="bloque footer">
	<ul>
		<li class="alumno">Federico Baigorria</li>
	</ul>
	<div class="footer-universidad">
		2015 - Facultad de Ingenieria - <b>UM</b>
	</div>
</div>
