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


4:02