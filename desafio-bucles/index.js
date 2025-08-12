// Imprimir pares del 1 al 30

function imprimirPares1a30() {
   for (let i = 1; i <= 30; i++) {
      if (i % 2 == 0) {
         console.log(i);
      }
   }
}

// Imprimir múltiplos de 4 de forma descendente

function imprimirMultiplos4() {
   for (let i = 100; i >= 0; i--) {
      if (i % 4 == 0) console.log(i);
   }
}

// Imprimir 10, 7, 4, 1, -2, -5

function imprimirSecuencia() {
   for (let i = 10; i >= -5; i -= 3) console.log(i);
}

// Suma todos los números pares del 1 al 50

function sumar1al50() {
   let resultado = 0;
   for (let i = 0; i <= 50; i++) {
      if (i % 2 == 0) resultado += i;
   }
   console.log(resultado);
}

// Factorial (del 1 al 20) -> 20!

function factorial20() {
   let resultado = 1;
   for (let i = 1; i <= 20; i++) {
      resultado *= i;
   }
   console.log(resultado);
}