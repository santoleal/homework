/**
 
- Condicional
- Ciclo
- Interacción: prompt, alert y console
- Funciones
Cálculos de entrada, cálculos de salida

 */

let noticiasParaComparar = [];
const menuEvaluacion = `
(1) Mirada crítica
(2) Mirada condescendiente
(3) Mirada neutra
(99) Salir 
`;

const ingresarNoticia = () => {
  const nombreMedio = prompt("¿De qué medio de comunicación es esta noticia?");
  const tituloNoticia = prompt("Copia aquí el título de la noticia");
  const cuerpoNoticia = prompt("Copia aquí el cuerpo de la noticia");

  let extractoNoticia = cuerpoNoticia.substring(0, 100); // substring perite una suerte de recorte de un texto largo....

  let extensionTitulo = tituloNoticia.length;
  let extensionCuerpoNoticia = cuerpoNoticia.length;
  let notaEvaluacion = evaluarNoticia();

  alert(`Medio a Analizar: ${nombreMedio}
  
Título de noticia: ${tituloNoticia}
Extensión del título: ${extensionTitulo} caracteres.

Extracto de cuerpo noticioso: ${extractoNoticia}... 
Extensión del cuerpo noticioso: ${extensionCuerpoNoticia} caracteres.


  `);

  return noticiasParaComparar.push([
    nombreMedio,
    tituloNoticia,
    cuerpoNoticia,
    notaEvaluacion,
  ]);
};

const evaluarNoticia = () => {
  const evaluar = parseInt(
    prompt(
      "Según tú, ¿con qué tipo de mirada aborda este medio el tema en cuestión?\n" +
        menuEvaluacion
    )
  );

  while (isNaN(evaluar)) {
    alert("Error. Debe ser un número");
  }
  switch (evaluar) {
    case 1:
      alert(" Su nota sobre el tipo de mirada es (" + (evaluar - 1) + ")");
      return evaluar - 1;
    case 2:
      alert(" Su nota es negativa (" + (evaluar - 3) + ")");
      return evaluar - 3; // se transforma a un valor negativo, para posicionarlo negativamente en una matriz de -1 a +1
    case 3:
      alert(" Su nota es positiva (+" + (evaluar - 2) + ")");
      return evaluar - 2;
    case 99:
      return "Ha decidido salir";

    default:
      alert("Número fuera de rango, intenta otra vez");
  }
  evaluar = parseInt(
    prompt(
      "Según tú, ¿esta nota tiene un enfoque tendencioso?\n" + menuEvaluacion
    )
  );
};

const compararNoticias = () => {};

do {
  i = 1;
  ingresarNoticia();
  i++;
  console.log(noticiasParaComparar);
} while (i < 3);
