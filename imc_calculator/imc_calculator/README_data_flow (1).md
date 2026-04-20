# Cómo se pasan datos entre widgets en Flutter

---

## Primero, una analogía

Imaginate que tenés una hoja de papel con el número **160** escrito.

Vos sos el **padre** (`ImcHomeScreen`). Tenés la hoja.

Le mostrás la hoja a tu amigo, que es el **hijo** (`HeightSelector`). Tu amigo puede **leer** el número, pero no puede borrar lo que vos escribiste. Si quiere cambiar el número, te tiene que **avisar a vos** para que vos lo cambies.

Eso es exactamente lo que pasa en Flutter.

---

## El padre guarda todo

En `ImcHomeScreen` están guardados todos los datos importantes:

```dart
// imc_home_screen.dart

double selectedHeight = 160; // la altura
int selectedWeight = 80;     // el peso
int selectedAge = 20;        // la edad
```

Estos números viven acá. En ningún otro lado.

---

## Cómo el padre le manda un dato al hijo

Cuando el padre crea el widget `HeightSelector`, le manda el dato adentro del paréntesis, como si fuera un parámetro:

```dart
// imc_home_screen.dart

HeightSelector(
  selectedHeight: selectedHeight, // le manda el 160 al hijo
)
```

Eso se llama **prop**. Es como darle la hoja de papel a tu amigo para que la lea.

---

## Cómo el hijo recibe ese dato

El hijo tiene que declarar que espera recibir ese dato. Lo hace con `final` arriba de todo:

```dart
// height_selector.dart

class HeightSelector extends StatefulWidget {
  final double selectedHeight; // "voy a recibir un número del padre"

  const HeightSelector({
    super.key,
    required this.selectedHeight, // 'required' = es obligatorio mandarlo
  });
}
```

Y para usarlo dentro del código, escribe `widget.` adelante:

```dart
Text("${widget.selectedHeight} cm") // muestra el 160 que mandó el padre
```

`widget.` es simplemente la forma de decir *"el dato que me mandaron"*.

---

## Cómo el hijo le avisa al padre que algo cambió

Acá viene la parte más importante.

Cuando el usuario mueve el slider, el hijo **no puede cambiar el 160 directamente**. Lo que hace es avisarle al padre con una función.

Esa función también la manda el padre cuando crea el widget:

```dart
// imc_home_screen.dart

HeightSelector(
  selectedHeight: selectedHeight,       // le manda el dato
  onHeightChange: (double newHeight) {  // le manda una función
    setState(() {
      selectedHeight = newHeight; // cuando el hijo avise, actualizá el número
    });
  },
)
```

Y el hijo, cuando el usuario mueve el slider, llama a esa función:

```dart
// height_selector.dart

Slider(
  value: widget.selectedHeight,
  onChanged: (double nuevaAltura) {
    widget.onHeightChange(nuevaAltura); // avisa al padre con el nuevo número
  },
)
```

Eso se llama **callback**. Es como si tu amigo te dijera *"oye, cambia el número a 175"*, y vos sos el único que puede hacerlo.

---

## El ciclo completo, paso a paso

```
1. El padre tiene selectedHeight = 160
           │
           │ le manda 160 al hijo
           ▼
2. HeightSelector muestra "160 cm"

3. El usuario mueve el slider a 175
           │
           │ el hijo llama a onHeightChange(175)
           ▼
4. El padre recibe el aviso y hace setState → selectedHeight = 175
           │
           │ le manda 175 al hijo
           ▼
5. HeightSelector ahora muestra "175 cm" ✅
```

---

## Lo mismo con NumberSelector, dos veces

`NumberSelector` se usa dos veces: para el peso y para la edad. Las dos veces el patrón es igual.

```dart
// imc_home_screen.dart

// Para el peso
NumberSelector(
  title: "PESO",
  value: selectedWeight.toString(), // le manda el 80
  onIncrement: () {
    setState(() { selectedWeight++; }); // cuando el hijo diga "más", suma 1
  },
  onDecrement: () {
    setState(() { selectedWeight--; }); // cuando el hijo diga "menos", resta 1
  },
),

// Para la edad
NumberSelector(
  title: "EDAD",
  value: selectedAge.toString(), // le manda el 20
  onIncrement: () {
    setState(() { selectedAge++; }); // cuando el hijo diga "más", suma 1
  },
  onDecrement: () {
    setState(() { selectedAge--; }); // cuando el hijo diga "menos", resta 1
  },
),
```

El hijo ni sabe si está manejando peso o edad. Solo sabe que tiene dos botones y que cuando los tocan tiene que avisar:

```dart
// number_selector.dart

FloatingActionButton(
  onPressed: () {
    widget.onIncrement(); // avisa "tocaron el +"
  },
)
```

El padre es el que decide qué hacer con ese aviso.

---

## GenderSelector — el que todavía no está conectado

`GenderSelector` por ahora guarda el género **él solo**, sin avisarle a nadie:

```dart
// gender_selector.dart

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender; // este dato no sale de acá
}
```

Visualmente funciona: las tarjetas cambian de color. Pero el padre nunca se entera de qué eligió el usuario. Cuando haya que calcular el IMC, el padre va a mirar su variable `selectedGender` y va a ver `null` porque nadie le avisó nada.

Todavía no está conectado con props ni callbacks. Eso viene después.

---

## Resumen en una sola imagen

```
         ImcHomeScreen
         (tiene todos los datos)
              │
              ├──── selectedHeight = 160 ────────────► HeightSelector
              │              ▲                         muestra "160 cm"
              │              └── onHeightChange(175) ──┘
              │
              ├──── selectedWeight = 80 ─────────────► NumberSelector "PESO"
              │              ▲                         muestra "80"
              │              └── onIncrement() ─────── botón +
              │
              ├──── selectedAge = 20 ────────────────► NumberSelector "EDAD"
              │              ▲                         muestra "20"
              │              └── onIncrement() ─────── botón +
              │
              └──── selectedGender = null ──────────── GenderSelector
                             (sin conectar todavía)
```

**Flecha para abajo** = el padre le manda un dato al hijo (prop)

**Flecha para arriba** = el hijo le avisa al padre que algo cambió (callback)
