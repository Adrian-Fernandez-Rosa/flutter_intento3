// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ButtonExample extends StatelessWidget {
  const ButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

        Spacer(),
        ElevatedButton(onPressed: () {

          print("pulsado");
        }, child:Text("Soy botoncito"), 
        onLongPress: () {
          print(" recontra pulsado");
        },
        style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.red)),
        ),
        Spacer()
      ],
    );
  }
}