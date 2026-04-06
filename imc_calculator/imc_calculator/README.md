# imc_calculator

A new Flutter project.

---

paso 1 ir al `pubspec yaml`  y cambiar la `description` y si uno quiere el `publish to`

---

paso 2 crear estructura de carpetas , `components`, `core` y `screen` dentro de `lib`

---

# screen

aca van  vistas completas de la app

- `home_screen.dart`
- `login_screen.dart`

Normalmente una screen:

- arma la estructura general de esa página
- usa varios widgets/componentes dentro
- puede conectarse con lógica o estado

---

# Components

son widget reutilizables más pequeños que puedes usar en varias pantallas,

## Ejemplos

- Boton personalizado
- Tarjeta
- Un campo de texto reutilizable
- un item de lista

---

# Core

Como el nombre bien lo dice, es el nucleo,

aca se suele guardar las cosas que no son para una sola pantalla, Ejemplo

Por ejemplo

- Colores globales,
- Theme
- rutas
- constantes
- helpers
- utilidades
- configuracion
- servicios comunes
- estilos de testo
- valores fijos de la app

## Ejemplos concretos:

- `core/theme/app_theme.dart`
- `core/constants/colors.dart`
- `core/utils/formatters.dart`

es decir: La idea del core es guardar lo que sirve como fundamento del proyecto.\

---

# Resumen fácil

Imagina una casa:

- Screens = las habitaciones completas
- Components = los muebles o piezas dentro de las habitaciones
- Core = la electricidad, reglas, materiales base y diseño general de toda la casa

`main.dart -> screens -> components -> core`

---

# Algo importante

En flutter hay muchas formas de organizar:

- Por tipo (`screens`, `widgets`, `services`)
- por feature(`auth`, `chat`, `products`)
- por capas(`data`, `domain`, `presentation`)