import json

# Carga el contenido del archivo JSON en una lista de diccionarios
with open('nivelidioma.json', 'r', encoding='utf-8') as file:
    data = json.load(file)


# Función para contar el número de pruebas de idiomas en el documento
def contar_pruebas_idiomas():
    contador = 0
    for prueba in data:
        if 'Prueba de nivel' in prueba['Nivel']:
            contador += 1
    return contador


# Función para obtener el título de las pruebas de nivel que duran más de dos horas
def pruebas_largas():
    pruebas = []
    for prueba in data:
        if prueba['Horas'] > 2:
            pruebas.append(prueba['Titulo'])
    return pruebas


# Función para obtener la URL de las pruebas de tipo "No Presencial"
def pruebas_no_presenciales():
    pruebas = []
    for prueba in data:
        if prueba['TipoFormacion'] == 'No Presencial':
            pruebas.append(prueba['URL'])
    return pruebas


# Función para obtener el título y los profesores de una prueba dado su ID
def obtener_info_prueba_por_id(id_prueba):
    for prueba in data:
        if prueba['ID'] == id_prueba:
            titulo = prueba['Titulo']
            profesores = [profesor['NombreCompleto'] for profesor in prueba['Profesorado']]
            rafa = " ".join(profesores)
            return titulo, rafa
    return "No se encontró una prueba con ese ID", []


# Función para obtener el título de cada prueba y sus respectivos profesores
def obtener_info_todas_pruebas():
    info_pruebas = []
    for prueba in data:
        titulo = prueba['Titulo']
        profesores = [profesor['NombreCompleto'] for profesor in prueba['Profesorado']]
        rafa = " ".join(profesores)
        info_pruebas.append((titulo, rafa))
    return info_pruebas


# Pruebas de las funciones
print("a) Número de pruebas de idiomas:", contar_pruebas_idiomas())

b = " ".join(pruebas_largas())
print(f"\nb) Pruebas de nivel que duran más de dos horas: {b}")

c = " ".join(pruebas_no_presenciales())
print(f"\nc) URL de las pruebas de tipo 'No Presencial': {c}")

id_prueba = input("\nIntroduce el ID de la prueba: ")
titulo, rafa = obtener_info_prueba_por_id(id_prueba)

print(f"\nd) Título de la prueba: {titulo}")
print("\tProfesores:", rafa)

print("\ne) Título de cada prueba y sus respectivos profesores:")
for titulo, rafa in obtener_info_todas_pruebas():
    print(f"\t - {titulo}: {rafa}")
