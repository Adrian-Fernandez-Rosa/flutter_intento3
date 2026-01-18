import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 38.0),
      child: Container(
        color: Colors.red,
        // height: double.infinity, //ahora crossaxisaligment del Row tiene efecto
        child: const Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
  //          Spacer(),

            Text('Ejemplo 1'),
//            Spacer(),
            Expanded(child: SizedBox()),
            Expanded(child: Text("Ejemplo 2")),
            Expanded(child: SizedBox()),
            Text('Ejemplo 3'),
            Text('Ejemplo 4'),
          ],
        ),
      ),
    );
  }
}