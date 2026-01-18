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
