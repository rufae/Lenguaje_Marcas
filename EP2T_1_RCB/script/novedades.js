function leerMas(i) {
  var puntos = document.getElementsByClassName("puntos");
  var masTxt = document.getElementsByClassName("mas");
  var btn = document.getElementsByClassName("leermas");
  var text = document.getElementsByClassName("text");

  if (puntos[i].style.display === "inline") {
      puntos[i].style.display = "none";
      btn[i].innerHTML = "Leer menos..."; 
      masTxt[i].style.display = "inline";
      text[i].style.maxHeight = text[i].scrollHeight + "px"; // Utiliza el alto total
  } else {
      puntos[i].style.display = "inline";
      btn[i].innerHTML = "Leer más..."; 
      masTxt[i].style.display = "none";
      text[i].style.maxHeight = "150px"; // Ajusta este valor al inicial que desees
  }
}
