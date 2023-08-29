from users.usuarios import Usuarios

class Clientes(Usuarios):
    
    # Definir al menos 4 atributos
    def __init__(self, email="", whatsapp="", ciudad="", pais=""):
        super().__init__()
        self.email = email
        self.whatsapp = whatsapp
        self.ciudad = ciudad
        self.pais = pais        

    # Definir al menos 2 métodos
    # Método 1: Completar info cliente     
    def completar_info(self):
        self.email = input("Agrega tu email: ")
        self.whatsapp = input("Agrega tu whatsapp: ")
        self.ciudad = input("Agrega tu ciudad: ")
        self.pais = input("Agrega tu país de residencia: ")

        info_cliente = {"email": self.email, "whatsapp": self.whatsapp, "ciudad": self.ciudad, "país": self.pais}


        # Aquí comienza la ubicación del usuario logueado dentro de la lista de usuarios, para añadir el diccionario creado para Cliente. En un primer momento fue el Método 2 aparte, pero era reiterativo en sus funciones con el Método 1.

        id_usuario_logueado = self.validar_cliente()

        if id_usuario_logueado != None:
            Usuarios.lista_usuarios[id_usuario_logueado]['info_cliente'] = info_cliente
            print(f"Se ha agregado la información del cliente al usuario logueado.")
            return Usuarios.lista_usuarios
        else:
            print("No se pudo guardar la información.")

        return info_cliente    
    

    # Método 2: 
    def modificar_info(self):
        #print(f"va bien...esta es la lsta {Usuarios.lista_usuarios}")
        #info_cliente = self.completar_info()
        id_usuario_logueado = self.validar_cliente()

        while (True):
            opcion = input("""
        Esta es el menú para modificar datos. 
        Escoge alguna opción: 
        (1)- Cambiar clave            
        (2)- Cambiar email
        (3)- Cambiar whatsapp  
        (4)- Cambiar ciudad
        (5)- Cambiar país
        (99) - Volver al menú principal
        """)
            if (opcion == "1"):
                nueva_clave = input("Ingrese su nueva clave: ")
                Usuarios.lista_usuarios[id_usuario_logueado]['clave'] = nueva_clave
                print(f"Cambio de clave OK. Esta es su nueva clave:  {nueva_clave}")
                return Usuarios.lista_usuarios

            elif (opcion == "2"):
                nuevo_email = input("Ingrese su nuevo email: ")
                Usuarios.lista_usuarios[id_usuario_logueado]['info_cliente']['email'] = nuevo_email
                print(f"Cambio de clave OK. Esta es su nuevo email: {nuevo_email}")
                return Usuarios.lista_usuarios
            
            elif (opcion == "3"):
                nuevo_whatsapp = input("Ingrese su nuevo whatsapp: ")
                Usuarios.lista_usuarios[id_usuario_logueado]['info_cliente']['whatsaap'] = nuevo_whatsapp
                print(f"Cambio de clave OK. Este es su nuevo whatsapp:  {nuevo_whatsapp}")
                return Usuarios.lista_usuarios
            
            elif (opcion == "4"):
                nueva_ciudad = input("Ingrese su nueva ciudad de residencia: ")
                Usuarios.lista_usuarios[id_usuario_logueado]['info_cliente']['ciudad'] = nueva_ciudad
                print(f"Cambio de clave OK. Esta es su ciudad de residencia:  {nueva_ciudad}")
                return Usuarios.lista_usuarios
            
            elif (opcion == "5"):
                nuevo_pais = input("Ingrese su nuevo país: ")
                Usuarios.lista_usuarios[id_usuario_logueado]['info_cliente']['país'] = nuevo_pais
                print(f"Cambio de clave OK. Este es su país de residencia: {nuevo_pais}")
                return Usuarios.lista_usuarios
            
            elif (opcion == "99"):
                break

            else:
                print("Opción no válida... intente otra vez")

    # Método adicional, para modularizar las funciones y segmentar mejor el programa
    def validar_cliente(self):
        indice_usuario_logueado = None
        for i, usuario in enumerate(Usuarios.lista_usuarios):
            if usuario['nombre'] == Usuarios.usuario_logueado:
                indice_usuario_logueado = i
                break
        return indice_usuario_logueado
