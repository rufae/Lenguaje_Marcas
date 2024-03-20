// Cargar el contenido del archivo JSON
fetch('nivelidioma.json')
    .then(response => response.json())
    .then(data => {
        // a) Contar el número de pruebas de idiomas
        let contadorIdiomas = 0;
        data.forEach(prueba => {
            if (prueba.Nivel.includes('Prueba de nivel')) {
                contadorIdiomas++;
            }
        });
        document.getElementById('a').innerHTML = contadorIdiomas;

        // b) Obtener el título de las pruebas de nivel que duran más de dos horas
        let pruebasMasDosHoras = data.filter(prueba => prueba.Horas > 2);
        pruebasMasDosHoras.forEach(prueba => {
            document.getElementById('b').innerHTML += '- ' + prueba.Titulo + '<br>';
        });

        // c) Obtener la URL de las pruebas de tipo "No Presencial"
        let urlsNoPresencial = data.filter(prueba => prueba.TipoFormacion === 'No Presencial');
        urlsNoPresencial.forEach(prueba => {
            document.getElementById('c').innerHTML += '- ' + prueba.URL + '<br>';
        });

        // d) Obtener el título y los profesores de una prueba por su ID
        const idPrueba = prompt("Introduce el ID de la prueba:");
        const infoPrueba = data.find(prueba => prueba.ID === idPrueba);
        if (infoPrueba) {
            document.getElementById('d').innerHTML += 'Título: ' + infoPrueba.Titulo + '<br>';
            document.getElementById('d').innerHTML += 'Profesorado: <br>';
            infoPrueba.Profesorado.forEach(profesor => {
                document.getElementById('d').innerHTML += '-> ' + profesor.NombreCompleto + '<br>';
            });
        } else {
            document.getElementById('d').innerHTML = 'No se encontró una prueba con ese ID';
        }

        // e) Obtener el título y los profesores de cada prueba
        data.forEach(prueba => {
            document.getElementById('e').innerHTML += 'Título: ' + prueba.Titulo + '<br>';
            document.getElementById('e').innerHTML += 'Profesorado: <br>';
            prueba.Profesorado.forEach(profesor => {
                document.getElementById('e').innerHTML += '-> ' + profesor.NombreCompleto + '<br>';
            });
            document.getElementById('e').innerHTML += '<br>';
        });
    });
