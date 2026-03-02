# bmicalculator

A Flutter application that calculates Body Mass Index (BMI) and categorizes results.

## Descripción del proyecto

Este proyecto implementa una **calculadora de índice de masa corporal (IMC)** usando Flutter. La interfaz permite al usuario seleccionar género, ajustar altura mediante un slider y modificar peso y edad con botones. Al pulsar el botón "CALCULATE" se calcula el BMI y se clasifica en una de cuatro categorías: bajo peso, normal, sobrepeso u obesidad.

El resultado se muestra en una nueva pantalla (`Result`) que: 
1. Muestra el valor del IMC con dos decimales.
2. Indica la categoría correspondiente.
3. Proporciona un mensaje descriptivo dinámico sacado de un mapa de frases en español (cambiando aleatoriamente cada vez).
4. Cambia el color del texto según la categoría (amarillo, verde, naranja o rojo).

La lógica para determinar la categoría se encuentra en `interface.dart` y el contenido dinámico en `result.dart`. 

## Funcionamiento

- El usuario interactúa con controles para definir altura, peso y edad.
- Al presionar el botón se calcula el BMI y se selecciona una categoría.
- La aplicación navega a la pantalla de resultados mostrando la información y permitiendo volver a calcular.

## Flujo de trabajo y lógica de programación

1. **Interfaz principal (`Interface`):**
   - Stateful widget que mantiene los valores de género, altura, peso, edad y BMI.
   - Uso de `Expanded`, `Row`, `Column` y `Container` para estructurar las áreas.
   - `Slider` para ajustar la altura; botones de suma/resta con `IconButton` para peso y edad.
   - Cada control llama a `setState` para actualizar la UI en tiempo real.
   - Al pulsar "CALCULATE" se transforma la altura a metros, calcula el BMI y asigna una categoría mediante condicionales.
   - Se construye un `MaterialPageRoute` hacia `Result` pasando BMI y categoría.

2. **Pantalla de resultados (`Result`):**
   - Stateful widget que recibe BMI y categoría como parámetros.
   - Declara un `Map` estático (`descripcionesIMC`) donde cada clave tiene una lista de mensajes.
   - Método `_descriptionForCategory` normaliza la clave, busca la lista y elige aleatoriamente una frase usando `Random`.
   - `_colorForCategory` devuelve un color asociado para pintar textos.
   - En `build` se muestran la categoría en mayúsculas, el valor numérico y el texto dinámico, con su correspondiente color.
   - Botón "RECALCULATE" navega de regreso a la `Interface` para reiniciar el cálculo.

3. **General:**
   - Se emplea `Navigator.push` y `Navigator.pop` para la navegación entre pantallas.
   - Cálculos y lógica localizados dentro del estado, manteniendo el código modular.
   - Comentarios breves y uso de constantes para claridad y mantenimiento.

Este diseño facilita la expansión futura (por ejemplo, añadir más idiomas o gráficos) y separa claramente la UI de la lógica de cálculo.

![Screen Shot](screenshot.jpg)