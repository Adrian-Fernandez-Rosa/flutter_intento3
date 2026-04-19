# 📱 IMC Calculator — Flutter

Proyecto de aprendizaje Flutter para construir una calculadora de Índice de Masa Corporal (IMC). Este README documenta paso a paso las decisiones de arquitectura, conceptos clave y el código utilizado.

---

## 🗂️ Índice

1. [Configuración inicial del proyecto](#paso-1--configuración-inicial)
2. [Estructura de carpetas](#paso-2--estructura-de-carpetas)
3. [Colores globales con AppColors](#paso-3--colores-globales-con-appcolors)
4. [StatelessWidget vs StatefulWidget](#paso-4--statelesswidget-vs-statefulwidget)
5. [Imágenes locales (assets)](#assets--imágenes-locales)
6. [GenderSelector — Componente](#componente-gender-selector)
7. [HeightSelector — Componente](#componente-height-selector)

---

## Paso 1 — Configuración inicial

Antes de escribir código, ajustar la identidad del proyecto en `pubspec.yaml`:

```yaml
name: imc_calculator
description: "Calculadora de IMC construida con Flutter"
# publish_to: 'none'  # Descomenta esto si NO quieres publicar el paquete en pub.dev
```

> **¿Por qué?** `description` aparece en pub.dev si publicas el paquete. `publish_to: none` evita publicaciones accidentales en proyectos privados o de aprendizaje.

---

## Paso 2 — Estructura de carpetas

Dentro de `lib/` se crean tres carpetas principales:

```
lib/
├── core/           ← Fundamentos globales del proyecto
├── components/     ← Widgets reutilizables
├── screens/        ← Vistas completas (páginas)
└── main.dart
```

### 🖥️ screens/
Contiene las **vistas completas** de la app. Cada screen representa una página entera.

```
screens/
├── imc_home_screen.dart
└── result_screen.dart
```

Una screen normalmente:
- Arma la estructura general de esa página
- Utiliza varios componentes dentro
- Se conecta con la lógica de estado

### 🧩 components/
Contiene **widgets reutilizables** más pequeños que pueden usarse en varias pantallas.

```
components/
├── gender_selector.dart
├── height_selector.dart
└── weight_selector.dart
```

Ejemplos de componentes:
- Botón personalizado
- Tarjeta (Card)
- Campo de texto reutilizable
- Ítem de lista

### ⚙️ core/
El **núcleo** del proyecto. Aquí vive todo lo que no pertenece a una sola pantalla sino a toda la app.

```
core/
├── app_colors.dart        ← Paleta de colores global
├── text_styles.dart       ← Estilos de texto reutilizables
├── theme/
│   └── app_theme.dart     ← Tema general de la app
├── constants/
│   └── app_constants.dart ← Valores fijos (strings, números)
└── utils/
    └── formatters.dart    ← Helpers y utilidades
```

Cosas que van en `core`:
- Colores globales
- Theme de la app
- Rutas de navegación
- Constantes
- Helpers / utilidades
- Configuración general
- Servicios comunes
- Estilos de texto
- Valores fijos

### 🏠 Analogía: la casa

| Elemento | Rol en Flutter |
|---|---|
| Las habitaciones | `screens/` — vistas completas |
| Los muebles | `components/` — piezas reutilizables |
| Electricidad y cimientos | `core/` — reglas y recursos base |

```
main.dart → screens → components → core
```

### 📌 Otras formas de organizar Flutter

Flutter no impone una estructura. Las más comunes son:

| Estilo | Carpetas |
|---|---|
| Por tipo | `screens/`, `widgets/`, `services/` |
| Por feature | `auth/`, `chat/`, `products/` |
| Por capas (Clean Architecture) | `data/`, `domain/`, `presentation/` |

Para proyectos pequeños o de aprendizaje, la organización por tipo (la que usamos aquí) es la más sencilla de entender.

---

## Paso 3 — Colores globales con AppColors

### `lib/core/app_colors.dart`

```dart
import 'package:flutter/material.dart';

/// Paleta de colores global de la aplicación.
/// 
/// Al centralizar los colores aquí, si el diseño cambia,
/// solo hay que modificar este archivo en lugar de buscarlos
/// uno por uno en toda la app.
class AppColors {
  // Constructor privado: esta clase no debe instanciarse,
  // solo se usan sus valores estáticos.
  AppColors._();

  // ── Colores principales ──────────────────────────────────
  static const Color primary   = Color(0xFF6200EB); // Morado principal
  static const Color secondary = Color(0xFF1F0344); // Morado oscuro
  static const Color accent    = Color(0xFFFFC401); // Amarillo de acento

  // ── Fondos ──────────────────────────────────────────────
  static const Color background                  = Color(0xFF0E0B20); // Fondo general
  static const Color backgroundComponent         = Color(0xFF1D1E32); // Fondo de tarjetas
  static const Color backgroundComponentSelected = Color(0xFF4F548B); // Tarjeta seleccionada
}
```

### Uso en `main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/screens/imc_home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta el banner rojo de "debug"
      home: Scaffold(

        appBar: AppBar(
          backgroundColor: AppColors.primary,    // Color de fondo del AppBar
          foregroundColor: Colors.white,         // Color del título e íconos
          title: const Text("IMC Calculator"),
        ),

        backgroundColor: AppColors.background,  // Fondo de la pantalla

        body: const ImcHomeScreen(),
      ),
    );
  }
}
```

---

## Paso 4 — StatelessWidget vs StatefulWidget

Esta es una de las decisiones más importantes en Flutter: **¿cambia la interfaz en pantalla?**

| Widget | Cuándo usarlo |
|---|---|
| `StatelessWidget` | La vista **no cambia** después de construirse |
| `StatefulWidget` | La vista **cambia** en respuesta a acciones del usuario |

### ¿Qué significa "que cambie"?

Que **algo visible en pantalla se actualiza**, por ejemplo:
- Cambia un número (altura, peso)
- Aparece o desaparece un mensaje
- Un color cambia al seleccionar una opción
- Se marca o desmarca un checkbox

### `imc_home_screen.dart`

```dart
import 'package:flutter/material.dart';

/// Pantalla principal de la calculadora IMC.
/// 
/// Se usa StatefulWidget porque el usuario interactúa con
/// selectores de género, altura y peso → la UI cambia.
class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  // createState() conecta el widget con su estado interno.
  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

/// La clase de estado es privada (prefijo _).
/// Convención de Flutter: nadie fuera de este archivo
/// debe instanciar o manipular el estado directamente.
class _ImcHomeScreenState extends State<ImcHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(); // Reemplazar con el contenido real
  }
}
```

---

## Assets — Imágenes locales

### 1. Crear la carpeta y agregar imágenes

```
assets/
└── images/
    ├── male.png
    └── female.png
```

> Se recomienda usar **PNG** por su soporte de transparencia, ideal para íconos e ilustraciones.

### 2. Registrar los assets en `pubspec.yaml`

```yaml
flutter:
  uses-material-design: true

  assets:
    - assets/images/   # Flutter incluirá todos los archivos de esta carpeta
```

> ⚠️ La indentación en YAML es crítica. Usa siempre **2 espacios**, nunca tabulaciones.

### 3. Usar la imagen en código

```dart
Image.asset(
  "assets/images/male.png",
  height: 100,
)
```

---

## Componente: Gender Selector

### `lib/components/gender_selector.dart`

#### Estilos de texto reutilizables — `lib/core/text_styles.dart`

Antes de construir el componente, notamos que el mismo `TextStyle` se repetiría en varios lugares. La solución es centralizarlo en `core/`:

```dart
import 'package:flutter/material.dart';

/// Estilos de texto globales de la aplicación.
/// 
/// Ventaja: si hay que cambiar la tipografía o el tamaño,
/// se modifica aquí y se refleja en toda la app automáticamente.
class TextStyles {
  TextStyles._(); // Constructor privado, clase no instanciable

  static const TextStyle bodyText = TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  static const TextStyle displayNumber = TextStyle(
    color: Colors.white,
    fontSize: 38,
    fontWeight: FontWeight.bold,
  );
}
```

#### Código completo del componente

```dart
import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

/// Widget para seleccionar el género del usuario.
/// 
/// Muestra dos tarjetas (Hombre / Mujer) que cambian de color
/// al ser seleccionadas. Usa StatefulWidget porque la UI cambia.
class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {

  /// Almacena el género seleccionado.
  /// Es String? (nullable) porque inicialmente no hay selección.
  /// 
  /// 💡 Mejora futura: usar un enum en lugar de String
  ///    para evitar errores de tipeo (ej: "hombre" vs "Hombre").
  ///    Ejemplo: enum Gender { male, female }
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildGenderCard(label: "Hombre", imagePath: "assets/images/male.png"),
        _buildGenderCard(label: "Mujer",  imagePath: "assets/images/female.png"),
      ],
    );
  }

  /// Construye una tarjeta de género reutilizable.
  /// 
  /// [label] es el texto a mostrar ("Hombre" o "Mujer").
  /// [imagePath] es la ruta del asset de imagen.
  Widget _buildGenderCard({required String label, required String imagePath}) {

    // Determina si esta tarjeta está seleccionada actualmente
    final bool isSelected = selectedGender == label;

    // Calcula el padding: 8px entre las tarjetas (izq + der = 16 total),
    // 16px en los bordes exteriores.
    final EdgeInsets cardPadding = label == "Hombre"
        ? const EdgeInsets.only(top: 16, right: 8,  bottom: 16, left: 16)
        : const EdgeInsets.only(top: 16, right: 16, bottom: 16, left: 8);

    return Expanded(
      // Expanded hace que cada tarjeta ocupe el 50% del ancho disponible
      child: GestureDetector(
        // GestureDetector hace que CUALQUIER widget sea clickeable
        onTap: () {
          setState(() {
            selectedGender = label; // Actualiza el estado y redibuja la UI
          });
        },
        child: Padding(
          padding: cardPadding,
          child: Container(
            decoration: BoxDecoration(
              // Cambia de color según si está seleccionado o no
              color: isSelected
                  ? AppColors.backgroundComponentSelected
                  : AppColors.backgroundComponent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Image.asset(imagePath, height: 100),
                  const SizedBox(height: 8),
                  Text(
                    label.toUpperCase(),
                    style: TextStyles.bodyText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

#### 💡 ¿Por qué `GestureDetector`?

En Flutter, los widgets por defecto no responden a toques. `GestureDetector` es un wrapper que añade interactividad a **cualquier widget**:

```dart
GestureDetector(
  onTap: () { /* acción al tocar */ },
  onLongPress: () { /* acción al mantener presionado */ },
  onDoubleTap: () { /* acción al doble tap */ },
  child: MiWidget(),
)
```

#### 💡 ¿Por qué `Expanded`?

Sin `Expanded`, las tarjetas solo ocupan el espacio mínimo que necesitan. Con `Expanded`, cada tarjeta ocupa el espacio disponible de forma equitativa dentro del `Row`.

---

## Componente: Height Selector

### `lib/components/height_selector.dart`

```dart
import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

/// Widget para seleccionar la altura del usuario mediante un Slider.
class HeightSelector extends StatefulWidget {
  const HeightSelector({super.key});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {

  /// La altura se almacena como double porque el widget Slider
  /// trabaja internamente con valores de tipo double.
  /// Se inicializa en 170 como valor central razonable.
  double height = 170;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [

            // Etiqueta del selector
            Text("Altura", style: TextStyles.bodyText),

            // Valor numérico actual
            // toStringAsFixed(0) convierte el double a string sin decimales
            // Ejemplo: 170.0 → "170"
            Text(
              "${height.toStringAsFixed(0)} cm",
              style: TextStyles.displayNumber,
            ),

            // Slider: componente de Material Design para seleccionar un valor
            // deslizando un indicador dentro de un rango.
            Slider(
              value: height,

              // Callback que se ejecuta cada vez que el usuario mueve el slider.
              // 'nuevaAltura' contiene el valor en tiempo real.
              onChanged: (double nuevaAltura) {
                setState(() {
                  height = nuevaAltura; // Actualiza el estado → redibuja el Text de arriba
                });
              },

              min: 150,       // Altura mínima en cm
              max: 220,       // Altura máxima en cm
              divisions: 70,  // Puntos de parada: (220-150) = 70 → cada 1 cm exacto
              label: "${height.toStringAsFixed(0)} cm", // Tooltip que aparece al arrastrar
              activeColor: AppColors.primary,           // Color del lado izquierdo del thumb
            ),
          ],
        ),
      ),
    );
  }
}
```

#### 💡 ¿Por qué `double` para la altura?

El widget `Slider` de Flutter trabaja exclusivamente con `double`. Aunque el usuario ve números enteros de centímetros, internamente el valor siempre es decimal (ej: `170.0`). Por eso se usa `toStringAsFixed(0)` para mostrar solo la parte entera.

#### 💡 ¿Qué hace `divisions`?

Sin `divisions`, el slider se mueve de forma continua (infinitos valores intermedios). Con `divisions: 70`, el slider solo puede detenerse en 70 puntos, que en un rango de 150–220 equivale a **saltos de 1 cm exacto**.

---

## 🚧 Próximos pasos

- [ ] Completar el componente **Weight Selector** (Peso)
- [ ] Crear la pantalla de **Resultados**
- [ ] Conectar los selectores con la lógica de cálculo del IMC
- [ ] Agregar navegación entre pantallas con `Navigator`
- [ ] Refactorizar `selectedGender` de `String?` a un `enum Gender`

---

## 📐 Fórmula del IMC

```
IMC = peso (kg) / altura (m)²
```

| IMC | Clasificación |
|---|---|
| < 18.5 | Bajo peso |
| 18.5 – 24.9 | Peso normal |
| 25.0 – 29.9 | Sobrepeso |
| ≥ 30.0 | Obesidad |

---

*Proyecto de aprendizaje Flutter — Adrian Fernandez Rosa*
