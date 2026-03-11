# flutter_intento3

# ¿Qué es Flutter?

**Flutter** es un **framework open-source** creado por **Google** para desarrollar **aplicaciones multiplataforma** usando **un solo código base**.

Con Flutter podés crear apps para:
- 📱 Android  
- 📱 iOS  
- 💻 Web  
- 🖥️ Desktop (Windows, macOS, Linux)

---

## Idea clave (muy importante)
> **Flutter no usa componentes nativos**  
> **Flutter dibuja toda la interfaz por sí mismo**

Esto lo hace mediante un motor gráfico propio llamado **Skia**.

### ¿Qué significa esto?
- La UI se ve **igual en todas las plataformas**
- Mucho control visual
- Animaciones fluidas
- Menos problemas de compatibilidad

---

## Lenguaje
Flutter utiliza el lenguaje **Dart**.

Características importantes de Dart:
- Tipado fuerte
- Orientado a objetos
- Sintaxis simple (similar a Java / JavaScript)
- Compilación **AOT (Ahead Of Time)** para alto rendimiento en producción

---

## Flutter es UI-first
En Flutter **todo es un Widget**:
- Un botón
- Un texto
- Un padding
- Una pantalla
- Una app completa

La interfaz se construye **completamente con código**, no con XML ni archivos visuales separados.

Ejemplo conceptual:
App
└── Screen
└── Column
├── Text
├── Button
└── Image


---

## ¿Qué tipo de apps se pueden hacer con Flutter?
- Apps de producción (bancos, startups, ecommerce)
- MVPs rápidos
- Apps educativas
- Dashboards
- Apps con animaciones complejas
- Apps multiplataforma con un solo equipo

Empresas que usan Flutter:
- Google  
- BMW  
- Alibaba  
- Nubank  
- eBay (parcial)

---

## Ventajas principales
- 🚀 Un solo código para múltiples plataformas
- 🎨 UI consistente
- ⚡ Alto rendimiento
- 🔥 Hot Reload (ver cambios al instante)
- 🧩 Gran ecosistema de paquetes

---

## Desventajas reales
- Apps un poco más pesadas que nativas
- No ideal para juegos 3D complejos
- Curva mental distinta (pensar en widgets)

---

## Resumen corto
> Flutter es un framework de Google que permite crear aplicaciones multiplataforma con un solo código, usando Dart y una interfaz construida completamente con widgets.


---

# 🏗️ Entendiendo Layouts Básicos en Flutter: Container y Column

```dart
import 'package:flutter/material.dart';

class ColumExample extends StatelessWidget {
  const ColumExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      // width: 200,
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Holus soy Adrian'),
          Text('Holus soy Adrian'),
          Text('Holus soy Adrian'),
          Text('Holus soy Adrian'),
          Text('Holus soy Adrian'),
          Text('Holus soy Adrian'),
        ],
      ),
    );
  }
}
```

Este ejercicio demuestra cómo centrar elementos en la pantalla utilizando una combinación de un contenedor (`Container`) y una columna (`Column`). A continuación, desglosamos los conceptos clave.

## 1. El Widget `Container` (El Contenedor)
El `Container` actúa como una caja que envuelve a otros elementos. En este ejemplo, es el widget padre.

* **`color: Colors.amber`**: Pintamos el fondo de la caja de color ámbar para visualizar cuánto espacio está ocupando en la pantalla.
* **`width: double.infinity`**: Esta instrucción es crucial. Le dice al contenedor: *"Intenta ser tan ancho como te permita tu padre (la pantalla)"*. Sin esto, el contenedor podría encogerse al ancho de los textos.

## 2. El Widget `Column` (La Columna)
La `Column` es un widget de layout que organiza a sus hijos (**children**) en una lista vertical, uno debajo del otro.

### 🧠 Concepto Clave: Los Ejes (Axes)
Para entender cómo alinear cosas, primero debemos entender los ejes en una Columna:

* **Eje Principal (Main Axis):** En una Columna, es el eje **Vertical** (↕️).
* **Eje Cruzado (Cross Axis):** En una Columna, es el eje **Horizontal** (↔️).

### Propiedades de Alineación
Aquí es donde ocurre la magia del centrado:

1.  **`mainAxisSize: MainAxisSize.max`**
    * Le dice a la columna: *"Ocupa todo el espacio vertical disponible"*.
    * Si no ponemos esto, la columna solo mediría lo que miden los textos juntos, y no podríamos centrarla verticalmente en la pantalla.

2.  **`mainAxisAlignment: MainAxisAlignment.center`**
    * Como el eje principal es vertical, esto significa: *"Pon los hijos en el centro vertical de la columna"*.

3.  **`crossAxisAlignment: CrossAxisAlignment.center`**
    * Como el eje cruzado es horizontal, esto significa: *"Alinea los hijos al centro horizontalmente"*.
    * *Nota:* Para que esto funcione visualmente, el `Container` padre debe tener ancho disponible (por eso usamos `double.infinity` arriba).

## 3. Children (Los Hijos)
La propiedad `children` recibe una lista de widgets (`[]`). En este caso, son varios widgets `Text` que se apilan uno sobre otro.

---

## 🎨 Diagrama Visual

Imagina la estructura así:

Pantalla (Scaffold)
 └── Container (Fondo Ámbar, Ancho Infinito)
      └── Column (Ocupa todo el alto)
           │
           ├── Text ("Holus...")  ⬆️
           ├── Text ("Holus...")  │  Eje Principal (Main Axis)
           ├── ...                │  (Centrado Verticalmente)
           └── Text ("Holus...")  ⬇️

           ↔️ Eje Cruzado (Centrado Horizontalmente)

## Centrar un widget entre dos bloques en un `Row` (patrón Flutter)

### Objetivo
Lograr una distribución visual como esta:

```dart

Row(
  children: const [
    Text('Ejemplo 1'),
    Expanded(child: SizedBox()),
    Text('Ejemplo 2'),
    Expanded(child: SizedBox()),
    Text('Ejemplo 3'),
    Text('Ejemplo 4'),
  ],
)
```

Ejemplo 1 |   espacio flexible   | Ejemplo 2 |   espacio flexible   | Ejemplo 3 Ejemplo 4




```dart

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  const TextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text("holus"),
        Text("Texto Grande", style: TextStyle(fontSize: 24)),
        Text("Texto Grande",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        Text(
          "Texto curvado",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
        ),

        Text(
          "Texto Colores",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30, color: Colors.green[300]),
        ),
        Text("Decorador", style: TextStyle(decoration: TextDecoration.underline, fontSize: 30,
        color: Colors.blueAccent, decorationColor: Colors.amber),),
        Text("Espaciado entre letras", style: TextStyle(letterSpacing: 5, fontSize: 20),),
        Text("Texto Largo, Texto Largo Texto LargoTexto LargoTexto Largo Texto Largo Texto Largo", style: TextStyle( fontSize: 30),maxLines: 2, overflow: TextOverflow.ellipsis,), // elipsis mete los 3 puntos
        Spacer(),
      ],
    );
  }
}

```


## TextField

```dart

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class TextFieldExample extends StatelessWidget {
  const TextFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        SizedBox(
          height: 60,
        ),
        TextField(),
        SizedBox(
          height: 32,
        ),
        TextField(),
        SizedBox(
          height: 32,
        ),
        TextField(
          decoration: InputDecoration(hintText: "Introduce tu email"),
        ),
        SizedBox(
          height: 32,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Introduce tu email", border: OutlineInputBorder()),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Introduce tu email",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder()),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Introduce tu contraseña",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder()),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            maxLines: 1,
            maxLength: 10,
            decoration: InputDecoration(
                hintText: "Introduce tu comentario",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder()),
          ),
        ),
        SizedBox(
          height: 32,
        )
      ],
    );
  }
}


```

# 📝 Entradas de Texto (TextField) en Flutter

En esta lección exploraremos el widget `TextField`, el componente principal en Flutter para capturar la entrada de datos del usuario por teclado. A través del código de ejemplo, veremos cómo evoluciona un campo de texto simple añadiendo diseño, seguridad y restricciones.

## 1. El Contenedor Principal: `ListView`

En lugar de utilizar una `Column`, este ejemplo envuelve todos los elementos en un `ListView`. 

**¿Por qué es importante esto?**
Cuando el usuario toca un `TextField`, el teclado del dispositivo se despliega desde la parte inferior ocupando la mitad de la pantalla. Si usáramos una `Column`, los elementos quedarían aplastados o generarían un error visual llamado *Bottom Overflow*. El `ListView` permite hacer *scroll* automáticamente para que el usuario pueda seguir navegando por los campos de texto cómodamente.

## 2. Separación y Espaciado (`SizedBox` y `Padding`)

Para que la interfaz respire y los campos no estén pegados, utilizamos dos estrategias:
* **`SizedBox(height: ...)`:** Crea un "caja vacía" que empuja los elementos hacia abajo, generando un salto de línea con una altura específica.
* **`Padding`:** Envuelve al `TextField` para añadir márgenes internos en todos sus lados (`EdgeInsets.all(8.0)`), separándolo de los bordes de la pantalla.

---

## 3. Anatomía y Evolución del `TextField`



A lo largo del código, el `TextField` va adquiriendo nuevas propiedades o "superpoderes":




decoration: InputDecoration(hintText: "Introduce tu email"),

Reto para los alumnos:
¿Cómo harían para capturar en una variable lo que el usuario ha escrito dentro de uno de estos TextField? (Pista: Investiguen sobre TextEditingController


## Botones

# 🖱️ Catálogo de Botones y Estados en Flutter

En esta sección exploraremos los principales tipos de botones que ofrece Material Design en Flutter. Además, aprenderemos a deshabilitarlos, a detectar pulsaciones largas y a darles un estilo personalizado.



## 1. Distribución del Espacio: El widget `Spacer`
Antes de ver los botones, nota que la `Column` empieza y termina con un `Spacer()`. 
* **¿Qué hace?** Actúa como un resorte invisible. Toma todo el espacio vertical sobrante de la pantalla y lo empuja. 
* Al poner uno arriba y uno abajo, "aplastan" a los botones hacia el centro exacto de la pantalla. Es una alternativa excelente a `mainAxisAlignment.center`.

---

## 2. Tipos de Botones

### A. ElevatedButton (Alta Jerarquía)
El botón principal de la pantalla. En el código, le hemos añadido "superpoderes":
* **`onLongPress`**: Además del clic normal (`onPressed`), podemos detectar si el usuario mantiene el dedo presionado sobre el botón.
* **Estilo Personalizado (`style`)**: Usamos `ButtonStyle` para cambiar el color de fondo a rojo. 
  > 🧠 **Nota avanzada:** Verás que usamos `WidgetStateProperty.all(Colors.red)`. Esto se debe a que un botón puede tener diferentes colores dependiendo de su estado (si está presionado, si está deshabilitado, etc.). Al usar `.all()`, le decimos: *"Quiero que seas rojo en absolutamente todos tus estados"*.

### B. OutlinedButton (Jerarquía Media)
El botón secundario, ideal para acciones como "Cancelar". Tiene un borde definido pero un fondo transparente.

### C. TextButton (Baja Jerarquía)
Es el botón más sutil de todos. No tiene fondo ni borde, solo el texto que reacciona al tacto.
* **Uso común:** Acciones que no deben distraer, como "Olvidé mi contraseña" o "Saber más".

---

## 3. Botones con Iconos



### D. FloatingActionButton (FAB)
Es el icónico botón circular que suele "flotar" en la esquina inferior derecha de las aplicaciones. 
* En la app de ProgredGroup, este sería el botón ideal para la acción principal de una pantalla, como "Agregar un nuevo registro" o "Crear mensaje". Suelen llevar un `Icon` en lugar de texto.

### E. IconButton
Un botón minimalista que solo muestra un icono. Perfecto para barras de navegación (AppBars) o acciones dentro de tarjetas (como darle "Me gusta" a un post con el `Icons.favorite`).

---

## 🚫 4. El Estado Deshabilitado (`onPressed: null`)

¿Te fijaste que algunos botones tienen `onPressed: null` en lugar de `onPressed: () {}`?

Esta es la forma oficial en Flutter de **apagar o deshabilitar** un botón. 
* Si le pasas `null`, Flutter automáticamente cambia el color del botón a un tono grisáceo y desactiva el efecto visual (splash) y de sonido al tocarlo. 
* **¿Cuándo usarlo?** Por ejemplo, cuando el usuario no ha terminado de llenar un formulario y no quieres que envíe los datos todavía.


# Imagenes

en nuestro pubspec yaml se debe meter la ruta de nuestros recursos a utilizar en el proyecto que pueden ser imagenes, sonidos, etc

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
```