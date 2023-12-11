class Clientes():
    # Esta es para almacenar nuevos clientes
    registro_cliente = {}
    
    # Definir al menos 4 atributos
    # - Nombre, apellido, email, pais
    def __init__(self, nombre="", apellido="", email="", pais=""):

        self.nombre = nombre
        self.apellido = apellido
        self.email = email
        self.pais = pais      
        self.valoracionpromedio = 0



    # Definir al menos 2 métodos:
    ##  1- Agregar nuevo cliente 
    #   2- Valorar compra



    # Métoodo 1: Agregar cliente

    def agregar_cliente(self, nuevocliente):
        while True:
            self.nombre = input("Ingrese su nombre: ")
            self.apellido = input("Ingrese su apellido: ")
            self.email = input("Ingrese su email: ").lower()

            if self.email in nuevocliente.registro_cliente:
                print("Lo siento, ese nombre ya está ocupado")
                continue
            
            self.pais = input("Ingrese país").capitalize()


            # Se añade el nuevo usuario registrado al diccionario de usuarios_registrados
            nuevocliente.registro_cliente[self.email] = {
                'Nombre': self.nombre,
                'Apellido': self.apellido,
                'Email': self.email,
                'Pais': self.pais
            }

            print("Usuario registrado exitosamente.")
            return f"El usuario registrado es: {nuevocliente.registro_cliente[self.email]}"
            


    # Método 2: Valorar compra
    
    def valorar_compra(self):
        while True:
            nota1= input("¿Qué nota le pondrías a este script? De 1 (mala experiencia) a 10 (muy buena experiencia)")

            if nota1.isdigit() and  1 >= int(nota1) <= 10:
                break
            else:
                print("Nota fuera de rango y/o digito no reconocido")
                

            nota2 = input("¿Qué nota le pondrías a los libros que se venden? De 1 (muy malos) a 10 (muy buenos)")
            if nota2.isdigit() and  1 >= int(nota2) <= 10:
                break
            else:
                print("Nota fuera de rango y/o digito no reconocido")
                


            self.valoracionpromedio = round((nota1 + nota2 / 2), 1)

            return f"El promedio de la valoración de este script es: {self.valoracionpromedio}"
