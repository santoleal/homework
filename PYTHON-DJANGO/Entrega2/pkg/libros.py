import lista_libros

# Se juega con esta otra clase, para leer la lista de libros que tengo en el archivo lista_libros.py
class Libros():

    def __init__(self):
        pass

    def ver_libros(self):
        self.libros = lista_libros.libros
        for libro in self.libros['titulo']:
            print(f"- Título: {libro}")
        
