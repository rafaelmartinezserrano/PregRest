/**
 * 
 */
 function comprobarAlias(){
	let alias = document.getElementById("nombreAlias").value;
	peticion = new XMLHttpRequest();
	peticion.open("get", `ComprobarAlias?nombreAlias=${alias}`, true);
	peticion.onreadystatechange = mostrarResultado;
	peticion.send();
}
function mostrarResultado(){
	if(peticion.readyState == 4 && peticion.status == 200){
		let repetido = peticion.responseText;
		let spanNombreDisponible = document.getElementById("nombreDisponible");
		let boton = document.getElementById("anularBoton");
		if(repetido == "true"){
			spanNombreDisponible.innerHTML = "El Alias ya esta en uso. Elige otro Alias";
			boton.disabled = true;
		}else{
			spanNombreDisponible.innerHTML = "El Alias esta Disponible";
			boton.disabled = false;
			
		}
	}
}