from users.clientes import Clientes
from users.usuarios import Usuarios

class Menu():

    def __init__(self, nombre ="", logueado = False, lista_usuarios = []):
        self.nombre = nombre
        self.logueado = logueado
        self.lista_usuarios = lista_usuarios        

    # Función añadida por mi cuenta, para practicar - Menú de navegación
    def opciones(self):
        opcion = input("""
        Escoge alguna opción: 
        (1)- Crea una cuenta
        (2)- Ingresa al sistema
        (3)- Sube tu nivel a cliente              
        (4)- Modifica tu información               
        (5)- Consulta por último usuario registrado  
        (6)- Revisa listado de usuarios
        (10)- Guardar / Actualizar todos los datos a JSON  
        (20)- Eliminar todos los datos a JSON                                            
        (99) - Salir del programa
        """)
        return opcion

    def menu(self):
 
        print("\n---------------------------------\n")    
        if self.logueado == True:
            print(f"Bienvenid@, {self.nombre}...")
        else:
            print(f"Bienvenidos a sistema de logueo... ")
        print("---------------------------------")
        
        

        while True:       
            opcion_escogida = self.opciones()
            registro = Usuarios()
            cliente = Clientes()
            
            if opcion_escogida == "99":
                print('''
                ---------------------------------
                Gracias, nos vemos
                ---------------------------------
                ''')
                exit()

            elif opcion_escogida == "1":
                #Registra nuevo usuario
                registro.registrar_usuario()
                lista_usuarios = registro.lista_usuarios
                print(f"Esta es la nueva lista de usuarios: {lista_usuarios}")
                
                self.volver_menu() # Regresar a opciones de menú

            elif opcion_escogida == "2":
                #Ingresa con tus credenciales
                usuario = registro.loguin()
                if usuario[1] == True:
                    self.nombre = usuario[0]
                    self.logueado = usuario[1]
                
                self.volver_menu() # Regresar a opciones de menú



            elif opcion_escogida == "3":
                #Registra como cliente
                if (self.logueado == True):
                    info_cliente = cliente.completar_info()
                    print(f"Esta es la info cliente: {info_cliente}")
                    print("Ok...info guardada")
                    
                else:
                    print("Debes loguearte primero para complementar esta acción")
                self.volver_menu() # Regresar a opciones de menú


            elif opcion_escogida == "4":
                # Modificar info
                if (self.logueado == True):
                    cliente.modificar_info()
                    print("Modificación terminada")
                else:
                    print("Debes loguearte primero para complementar esta acción")
                self.volver_menu() # Regresar a opciones de menú

            elif opcion_escogida == "5":
                #Consulta último usuario registrado
                if (self.logueado == True):
                    registro.ver_ultimoregistro(registro.lista_usuarios)            
                else:
                    print("Debes loguearte primero para complementar esta acción")
                self.volver_menu() # Regresar a opciones de menú


            elif opcion_escogida == "6":
                #Revisa listado de usuarios. Esto no se vincula a función específica, sino a una confirmación de si está logueado o no para poder acceder.
                if (self.logueado == True):
                    print(registro.lista_usuarios)
                else:
                    print("Debes loguearte primero para complementar esta acción")
                
                self.volver_menu() # Regresar a opciones de menú


            elif opcion_escogida == "10":
                #Para crear o actualizar archivo JSON.
                if (self.logueado == True):
                    print(registro.guardar_json())
                else:
                    print("Debes loguearte primero para complementar esta acción")
                
                self.volver_menu() # Regresar a opciones de menú


            elif opcion_escogida == "20":
                #Para eliminar datos de archivo JSON.
                if (self.logueado == True):
                    print(registro.eliminar_data_json())
                else:
                    print("Debes loguearte primero para complementar esta acción")
                
                self.volver_menu() # Regresar a opciones de menú


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




