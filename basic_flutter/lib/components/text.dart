import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  const TextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
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
          "Texto curvado",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
        ),
        
        Spacer(),
      ],
    );
  }
}
