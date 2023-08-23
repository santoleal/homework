const cursos = ["Liderazgo Efectivo", "Comunicación Efectiva", "Manejo de Conflictos", ];
const precio = 10000;

let cobroFinal = 0;
let comprados = [];
let cantidad = 0;
let descuento_1 = 0.20;
let descuento_2 = 0.30;
let descuento_3 = 0.50;
let txt_bienvenida = "Hola! \n\nHaz llegado aquí para capacitarte en Empoderamiento Organizacional y Liderazgo.";
let txt_instruccion = "Cada curso tiene un valor de $" + precio + ".-.\n\n¡Puedes tomar todos los que quieras!\n\n\t- Por 3 cursos contratados tendrás una rebaja de " + (descuento_1 * 100) + "%.\n\t- Por 6 cursos contratados tendrás una rebaja de " + (descuento_2 * 100) + "%.\n\t- Por 10 cursos contratados tendrás una rebaja de " + (descuento_3 * 100) + "%."

alert(txt_bienvenida);
alert(txt_instruccion);

let menu = prompt("Elige el o los cursos que te interesan: \n\n(1) - "+ cursos[0] +";\n(2) - "+ cursos[1] +";\n(3) - "+ cursos[2] +";\n(99) - Salir del menú")

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

        default:
            alert("Código no reconocido");
            break;
    }
    menu = prompt("Elige el o los cursos que te interesan: \n(1) - "+ cursos[0] +";\n(2) - "+ cursos[1] +";\n(3) - "+ cursos[2] +";\n(99) - Salir del menú")
}

rebajar();

function elegir(curso) {
    cobroFinal += precio;
    alert("Elegiste: " + curso +". \nSumas $" + cobroFinal + " por pagar.");
    comprados +=  curso;
    cantidad ++;
}



function rebajar(){
    if  (cantidad >= 3 && cantidad < 6) {

        precioRebajado = cobroFinal - (cobroFinal * descuento_1); 
        
        alert("Por todos los cursos comprados el total debería ser: $" +cobroFinal + ".\n\nCon la rebaja por la compra de "+cantidad+ " cursos ("+ (descuento_1*100)+ "% de descuento), el precio final es: $"+precioRebajado+".");        
    }
    else if (cantidad >= 6 && cantidad <= 9) {
        precioRebajado = cobroFinal - (cobroFinal * descuento_2); 
        
        alert("Por todos los cursos comprados el total debería ser: $" +cobroFinal + ".\n\nCon la rebaja por la compra de "+cantidad+ " cursos ("+ (descuento_2*100)+ "% de descuento), el precio final es: $"+precioRebajado+".");
    }
    else if (cantidad >10) {
        precioRebajado = cobroFinal - (cobroFinal * descuento_3); 
        
        alert("Por todos los cursos comprados el total debería ser: $" +cobroFinal + ".\n\nCon la rebaja por la compra de "+cantidad+ " cursos ("+ (descuento_3*100)+ "% de descuento), el precio final es: $"+precioRebajado+".");
    }
    else{
        alert("Usted ha comprado " + cantidad + " cursos. Por todos los cursos comprados debes pagar: $" +cobroFinal + ".");
    }

}