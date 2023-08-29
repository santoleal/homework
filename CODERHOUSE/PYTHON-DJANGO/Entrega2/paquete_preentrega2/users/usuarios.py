import json
# Basado en la pre-entrega1, se ajusta una clase padre, para realizar diversas acciones

class Usuarios():

    lista_usuarios = []
    usuario_logueado = None
    usuario_nuevo = {}
    
    def __init__(self):
        self.id = len(Usuarios.lista_usuarios) +1

    # Función 1: Registrar usuarios
    def registrar_usuario(self):
        user = input("Ingrese su nombre de usuario: ")
        user = user.lower()
        for i in Usuarios.lista_usuarios:
            while i['nombre'] == user:
                print("Lo siento, ese nombre ya está ocupado")
                user = input("Ingrese su nombre de usuario: ")
                user = user.lower()

        clave = input("Ingrese contraseña: ")
        while len(clave) < 5:
            print("Lo siento, contraseña muy débil. Tiene que ser más de 5 letras y/o numeros")
            clave = input("Ingrese contraseña: ")

        Usuarios.usuario_nuevo = {'id':self.id, 'nombre': user, 'clave': clave}
        Usuarios.lista_usuarios.append(Usuarios.usuario_nuevo) # Se añade nuevo usuario registrado a la lista de usuarios
        self.id += 1 #Se añade un nuevo ID
        print("Ok, usuario y contraseña creada")
        print(f"La cuenta creada es: {Usuarios.usuario_nuevo}")

        return Usuarios.lista_usuarios, Usuarios.usuario_nuevo # Aquí se retorna el valor del nuevo usuario tras la función, y en el menú se asigna este valor a variable



    # Funcion 2: Consultar último registro

    def ver_ultimoregistro(self, lista_usuarios):
        if len(lista_usuarios) > 0:
            ultimo_registro = self.lista_usuarios[-1]
            ultimo_user = list(ultimo_registro.values())[1]
            devolver = (f"Se acaba de inscribir: {ultimo_user}...")
            print(devolver)
        else:
            print("No hay ningún usuario registrado...")
        
            


    # Función 3 - Loguearse
    def loguin(self, loguin = None):
        self.loguin = loguin
        usuario = input("Ingrese nombre usuario: ").lower()
        iu = 3 # Límite de intentos usuario
        ip = 3 # Límite de intentos password
        encontrado = False
        while iu > 0 or encontrado == False:
            for buscarusuario in Usuarios.lista_usuarios:
                if buscarusuario['nombre'] == usuario:
                    encontrado = True
                    while ip > 0 and encontrado == True:
                        password = input("Ingrese clave: ")
                        if password == buscarusuario['clave']:
                            usuario = [usuario]
                            # usuario.append(True)
                            print("\n-----------------\n")
                            print(f"Hola, {usuario[0]}. Acceso correcto.")
                            self.loguin = True
                            Usuarios.usuario_logueado = usuario[0]
                            print(f"Este es el usuario logueado: {Usuarios.usuario_logueado}")
                            return Usuarios.usuario_logueado, self.loguin 
                        else:
                            ip-= 1
                            print(f"Contraseña incorrecta. Te quedan {ip} intentos")
                    if ip == 0:
                        print("Se agotaron todos los intentos de contraseña. Chaito")
                        exit()
                    break
            if encontrado == True:
                break
            else:
                print(f"Usuario no reconocido. Te quedan {iu} intentos")
                self.usuario = input("Ingrese nombre usuario: ").lower()
                iu-=1
                if iu == 0:
                    print("Se agotaron los intentos. Adios!")
                    exit()
        

    # Función 4: Mostrar usuarios.
    def mostrar_usuarios(self):
        for llaves in self.lista_usuarios:
            nombre = (list(llaves.values()))[0]
            clave = (list(llaves.values()))[1]
            print(f"Usuario: {nombre} - Contraseña: {clave}")


    # Función 5: Guardar lista de usuarios creada en JSON

    def guardar_json(self):
        with open("listado_usuarios.json", 'w') as file:
            try:
                json.dump(self.lista_usuarios, file, indent = 4)
                print(f"Archivo JSON creado o actualizado exitosamente...")
            except Exception as e:
                print(f"Error al intentar crear el archivo JSON: {e}")
            finally:
                print("-----------------")
    

    def eliminar_data_json(self):
        
        try:
            borrar_usuarios = [] # Esta es para sobreescribir datos

            with open("listado_usuarios.json", 'w') as file:
                json.dump(borrar_usuarios, file, indent = 4)
                print(f"Archivo JSON borrado, por completo, exitosamente...")
        except Exception as e:
            print(f"Error al intentar eliminar el archivo JSON: {e}")

        finally:
            print("-----------------")