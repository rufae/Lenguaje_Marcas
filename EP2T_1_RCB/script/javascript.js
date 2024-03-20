addEventListener('load',inicio,false);

function inicio(){
    document.getElementById('number').addEventListener('change',cambioTemperatura,false);
}

function cambioTemperatura(){    
    document.getElementById('num').innerHTML=document.getElementById('number').value;
}

//carrusel//


/* Variables */
const imgLabel = document.getElementById("tododiscos")

let imgOrder = [1, 2, 3]
let selector = 0

/* Al inicio */
/* Desordena la lista */
for (let i = 0;i < imgOrder.length;i++){
    let number = Math.floor(Math.random()* imgOrder.length)
    let temp = imgOrder[i]
    imgOrder[i] = imgOrder[number]
    imgOrder[number] = temp
}

/* A cada valor le da su imagen */
for (let i = 0; i < imgOrder.length; i++){
    if (imgOrder[i] === 1){
        imgOrder[i] = "img/carrusel/1.png"
    }
    else if (imgOrder[i] === 2){
        imgOrder[i] = "img/carrusel/2.png"
    }
    else{
        imgOrder[i] = "img/carrusel/3.png"
    }
}
imgLabel.src = imgOrder[selector]

/* Cada cinco segundos... */
setInterval( function changeSrc(){
    selector++
    if (selector === 3){
        selector = 0
    }
    imgLabel.src = imgOrder[selector]
},5000)


function vermas(id){
    if(id=="mas"){
    document.getElementById("desplegar").style.display="block";   
    document.getElementById("mas").style.display="none"; 
    }
    else{
    document.getElementById("desplegar").style.display="none";
    document.getElementById("mas").style.display="inline";
    }
    }

function vermas2(id){
    if(id=="mas2"){
    document.getElementById("desplegar2").style.display="block";   
    document.getElementById("mas2").style.display="none"; 
    }
    else{
    document.getElementById("desplegar2").style.display="none";
    document.getElementById("mas2").style.display="inline";
    }
    }

function vermas3(id){
    if(id=="mas3"){
    document.getElementById("desplegar3").style.display="block";   
    document.getElementById("mas3").style.display="none"; 
    }
    else{
    document.getElementById("desplegar3").style.display="none";
    document.getElementById("mas3").style.display="inline";
    }
    }