/**
 * 
 */
 var idPartida;
 
 function partidaLista(partida){
	idPartida = partida;
	let url = `Esperando?idPartida=${idPartida}`;
	peticion = new XMLHttpRequest();
	peticion.open("get", url, true);
	peticion.onreadystatechange = empezarPartida;
	peticion.send();
}

function empezarPartida(){
	if(peticion.readyState == 4 && peticion.status == 200){
		let empezar = peticion.responseText;
		if (empezar == "true") {
			window.location.assign(`jugar.jsp?idPartida=${idPartida}`);
		}
	}
}