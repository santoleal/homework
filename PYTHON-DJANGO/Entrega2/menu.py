from pkg.cliente import Clientes
from pkg.libros import Libros


class Menu():

    def __init__(self):
        pass
        

    # Función añadida por mi cuenta, para practicar - Menú de navegación
    def opciones(self):
        self.opciones = input("""
        Escoge alguna opción: 
        (1)- Completa tus datos de cliente
        (2)- Revisa productos                          
        (3)- Valora tu experiencia 
        (99) - Salir del programa
        """)
        return self.opciones

    def menu(self):
 
        print("\n---------------------------------\n")    
        print(f"Bienvenid@ a este sitio de Libros Usados")
        

        while True:       
            opcion_escogida = Menu.opciones()
            
            if opcion_escogida == "99":
                return ('''
                ---------------------------------
                Gracias, nos vemos
                ---------------------------------
                ''')


            elif opcion_escogida == "1":
                #Completa datos cliente
                Clientes.agregar_cliente()
                print(f"Se ha agregado nuevo cliente")
                self.volver_menu() # Regresar a opciones de menú


            elif opcion_escogida == "2":
                #Revisa productos
                Libros.ver_libros()
                
                self.volver_menu() # Regresar a opciones de menú



            elif opcion_escogida == "3":
                # Valora experiencia del programa
                Clientes.valorar_compra()
                self.volver_menu()


            else:
                print("Opción no válida. Intente nuevamente.")



    # Función añadida - Preguntar si volver a menú principal
    def volver_menu(self):
        pregunta = input("¿Desea volver al menú principal? S / n  : ").lower()
        while pregunta != "s" and pregunta != "n":
            print("Opción no reconocida. Intente otra vez con letra 's' o 'n' ")
            pregunta = input("¿Desea volver al menú principal? S / n  : ").lower()
        if pregunta == "s":
            self.menu()

        if pregunta == "n":
            print("Ha abandonado el programa. Adios!")
            exit()




