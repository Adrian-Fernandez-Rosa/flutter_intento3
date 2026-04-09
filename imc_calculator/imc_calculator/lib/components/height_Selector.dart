// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HeightSelector extends StatefulWidget {
  const HeightSelector({super.key});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {

  // Variable para almacenar cm, el componente que vamos a usar solo acepta tipo de datos double.
  double height = 170; // Altura inicial

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Altura"),
        Text("$height cm"),
        Slider(value: height, onChanged: (value) {},
        // Cambiamos minimo y maximos del Slider porque por defecto solo acepta 0 y 1 
        min: 150,
        max: 220,
        )
      ],
    );
  }
}