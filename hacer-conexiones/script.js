document.querySelector("#edit").onclick = function () {
    let nombre = document.querySelector("#nombre");

    if (nombre.innerText == "Candela Yarossi") nombre.innerText = "Candyarossi";
    else nombre.innerText = "Candela Yarossi";

    //(nombre.innerText == "Candela Yarossi") ? nombre.innerText = "Candyarossi" : nombre.innerText = "Candela Yarossi";
}

document.querySelectorAll(".sumar").forEach(boton => {
    boton.addEventListener("click", function () {
        document.getElementById("contadorSolicitudes").innerText--;
        document.getElementById("contadorConexiones").innerText++;
        boton.parentElement.style.display = "none";
    })
})

/*for (let index = 0; index < document.querySelectorAll(".sumar").length; index++) {
    const boton = document.querySelectorAll(".sumar")[index];
    // Llamado al evento
}

for (const boton of document.querySelectorAll(".sumar")) {
    // Llamado al evento
}*/

document.querySelectorAll(".restar").forEach(boton => {
    boton.addEventListener("click", function () {
        document.getElementById("contadorSolicitudes").innerText--;
        // boton.parentElement.style.display = "none";
        boton.parentElement.remove();
    })
})
