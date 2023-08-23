/* SE COMENTAN, YA QUE PASAN A SER PARTE DE OBJETOS LITERALES EN ARCHIVO CURSOS.JS */
// const cursos = ["Liderazgo Efectivo", "Comunicación Efectiva", "Manejo de Conflictos", ];
// const precio = 10000;

console.table(cursos); // Para comprobar conexión con array de objeto cursos. Lo muestra en la consola en forma de tabla.



let cobroFinal = 0;
let comprados = [];
let cantidad = 0;
let descuento_1 = 0.20;
let descuento_2 = 0.30;
let descuento_3 = 0.50;


let txt_bienvenida = "Hola! \n\nHaz llegado aquí para capacitarte en Empoderamiento Organizacional y Liderazgo.";
let txt_instruccion = "Cada curso tiene un valor distinto.\n\n¡Puedes tomar todos los que quieras!\n\n\t- Por 3 cursos contratados tendrás una rebaja de " + (descuento_1 * 100) + "%.\n\t- Por 6 cursos contratados tendrás una rebaja de " + (descuento_2 * 100) + "%.\n\t- Por 10 cursos contratados tendrás una rebaja de " + (descuento_3 * 100) + "%."

alert(txt_bienvenida);
alert(txt_instruccion);

let menu = prompt("Elige el o los cursos que te interesan: \n\n(1) - "+ cursos[0].titulo +";\n(2) - "+ cursos[1].titulo +";\n(3) - "+ cursos[2].titulo +";\n(4) - "+ cursos[3].titulo +";\n(5) - "+ cursos[4].titulo +";\n(99) - Salir del menú")

while(menu != "99") {
    switch(menu) {
        case "1":
            elegir(cursos[0])
            break;

        case "2":
            elegir(cursos[1])
            break;
        
        case "3":
            elegir(cursos[2])
            break;

        case "4":
            elegir(cursos[3])
            break;         
            
        case "5":
            elegir(cursos[4])
            break;

        default:
            alert("Código no reconocido");
            break;
    }
    menu = prompt("Elige el o los cursos que te interesan: \n\n(1) - "+ cursos[0].titulo +";\n(2) - "+ cursos[1].titulo +";\n(3) - "+ cursos[2].titulo +";\n(4) - "+ cursos[3].titulo +";\n(5) - "+ cursos[4].titulo +";\n(99) - Salir del menú")
}


let mensajeDescuento = rebajar();

alert("Usted ha elegido los siguientes cursos:\n\t-" +comprados.join("\n\t-")+ "\n\n En total son "+cantidad+ " cursos comprados.");
alert(mensajeDescuento);




function elegir(cursito) {
    cobroFinal += cursito.precio;
    alert("Elegiste: " + cursito.titulo +". \nSumas $" + cobroFinal + " por pagar.");
    comprados.push(cursito.titulo);
    cantidad ++;
}




function rebajar(){
    let descuentoFinal;

    if  (cantidad >= 3 && cantidad < 6) {

        precioRebajado = cobroFinal - (cobroFinal * descuento_1); 
        
        descuentoFinal = "Por todos los cursos comprados el total debería ser: $" +cobroFinal + ".\n\nCon la rebaja por la compra de "+cantidad+ " cursos ("+ (descuento_1*100)+ "% de descuento), el precio final es: $"+precioRebajado+".";
    }
    else if (cantidad >= 6 && cantidad <= 9) {
        precioRebajado = cobroFinal - (cobroFinal * descuento_2); 
        
        descuentoFinal = "Por todos los cursos comprados el total debería ser: $" +cobroFinal + ".\n\nCon la rebaja por la compra de "+cantidad+ " cursos ("+ (descuento_2*100)+ "% de descuento), el precio final es: $"+precioRebajado+".";
    }
    else if (cantidad >10) {
        precioRebajado = cobroFinal - (cobroFinal * descuento_3); 
        
        descuentoFinal = "Por todos los cursos comprados el total debería ser: $" +cobroFinal + ".\n\nCon la rebaja por la compra de "+cantidad+ " cursos ("+ (descuento_3*100)+ "% de descuento), el precio final es: $"+precioRebajado+".";
    }
    else{
        descuentoFinal = "Usted ha comprado " + cantidad + " cursos. Por todos los cursos comprados debes pagar: $" +cobroFinal + ".";
    }
    return descuentoFinal;

}

// Queda pendiente:

// COLOCAR MÉTODOS DE BÚSQUEDA Y FILTRADO SOBRE LOS ARRAYS.

// LISTAR CON UN CICLO LAS OPCIONES .

// CONSTRUIR CLASES DE OBJETO



