// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ImageExample extends StatelessWidget {
  const ImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6OrVvcJ9NA-WQuRWXSn5f9qItjFx6nanvvQ&s")

      ],
    );
  }
}