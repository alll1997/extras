//VARIABLES DE INGRESO DE TEXTO
const textInput = document.querySelector(".text-area");
const textOutput = document.querySelector(".mensaje-texto");

//LLAMADA DEL BOTÓN DE COPIADO
const btn = document.querySelector(".btn-copy");

//FUNCIÓN DEL BOTÓN ENCRIPTAR
function btnEncriptarText(){
    const textEncriptado = encriptarText(textInput.value);
    textOutput.value = textEncriptado;
    textInput.value = "";
    textOutput.style.backgroundImage = "none";
    
};

//FUNCIÓN PARA ENCRIPTAR LLAVES
function encriptarText(string){
    let matrizEncrypt = [
        ["a","ai"],
        ["e","enter"],
        ["i","imes"],
        ["o","ober"],
        ["u","ufar"]
    ];
    string = string.toLowerCase();
    for(let i = 0; i < matrizEncrypt.length; i++){
        if(string.includes(matrizEncrypt[i][0])){
            string = string.replaceAll(matrizEncrypt[i][0], matrizEncrypt[i][1]);
        };
    };
    return string;
};

//FUNCIÓN DEL BOTÓN DESENCRIPTAR
function btnDesncriptarText(){
    const textDesencriptado = desencriptarText(textInput.value);
    textOutput.value = textDesencriptado;
    textInput.value = "";    
};

//FUNCIÓN PARA DESENCRIPTAR LLAVES
function desencriptarText(string){
    let matrizEncrypt = [
        ["a","ai"],
        ["e","enter"],
        ["i","imes"],
        ["o","ober"],
        ["u","ufar"]
    ];
    string = string.toLowerCase();
    for(let i = 0; i < matrizEncrypt.length; i++){
        if(string.includes(matrizEncrypt[i][1])){
            string = string.replaceAll(matrizEncrypt[i][1], matrizEncrypt[i][0]);
        };
    };
    return string;
};

//FUCIÓN PARA COPIAR
btn.addEventListener('click', e=>{
    textOutput.select();
    document.execCommand('copy');
});





