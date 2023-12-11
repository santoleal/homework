/**
 
- Condicional
- Ciclo
- Interacción: prompt, alert y console
- Funciones
Cálculos de entrada, cálculos de salida

 */

// EN ESTA PRE-ENTREGA SE "COMPARARAN" MÁXIMO 2 NOTICIAS

let noticiasParaComparar = [];
let nNoticias = 0;
const menuVerNoticias = `
Visualice la noticia ingresada:
(1) Ver noticia 1
(2) Ver noticia 2
(99) Salir
`;
const menuEvaluacion = `
(1) Mirada crítica
(2) Mirada condescendiente
(3) Mirada neutra
(99) Salir 
`;

// Función ingresar noticia

const ingresarNoticia = () => {
  while (nNoticias < 2) {
    alert("Ingrese noticia número: " + (nNoticias + 1));
    const nombreMedio = prompt(
      "¿De qué medio de comunicación es esta noticia?"
    );
    const tituloNoticia = prompt("Copia aquí el título de la noticia");
    const cuerpoNoticia = prompt("Copia aquí el cuerpo de la noticia");

    noticiasParaComparar.push([nombreMedio, tituloNoticia, cuerpoNoticia]);
    console.log("Se chequea la vuelta nº" + (nNoticias + 1));
    nNoticias++;
  }
  console.log(noticiasParaComparar);
};

// Función ver noticia ingresada
const verNoticiasIngresadas = () => {
  let elegir;
  do {
    elegir = parseInt(prompt(menuVerNoticias));

    while (isNaN(elegir) || (elegir !== 1 && elegir !== 2 && elegir !== 99)) {
      elegir = parseInt(
        prompt("Tiene que elegir un número válido: " + menuVerNoticias)
      );
    }

    switch (elegir) {
      case 1:
      case 2:
        alert(`- Título: ${noticiasParaComparar[parseInt(elegir - 1)][1]}
        - Extensión del título: ${
          noticiasParaComparar[elegir - 1][1].length
        } caracteres.
        - Resumen de cuerpo: ${noticiasParaComparar[elegir - 1][2].substring(
          0,
          100
        )}
        - Extensión total del cuerpo noticioso: ${
          noticiasParaComparar[elegir - 1][2].length
        }`);
        break;
      case 99:
        alert("Decidió salir. Adiós.");
        break;
      default:
        alert("Algo falla...");
    }
  } while (elegir !== 99);
};

// Invoco a las funciones

ingresarNoticia();
verNoticiasIngresadas();
