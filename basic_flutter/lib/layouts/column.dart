import 'package:flutter/material.dart';

class ColumExample extends StatelessWidget {
  const ColumExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: 200,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
