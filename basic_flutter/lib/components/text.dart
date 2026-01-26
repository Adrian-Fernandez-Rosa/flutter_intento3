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
        Text("Texto Largo, Texto Largo Texto LargoTexto LargoTexto Largo Texto Largo Texto Largo", style: TextStyle( fontSize: 30),maxLines: 2, overflow: TextOverflow.ellipsis,),
        Spacer(),
      ],
    );
  }
}
