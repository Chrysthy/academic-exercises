function getValue() {

    let value = document.getElementById("name").value;

    document.getElementById("result").innerHTML = `Bem vindo(a), ${value}!`
}

function removeValue() {
    
    document.getElementById("name").value = "";
    document.getElementById("result").innerHTML = "Até a próxima!"

}