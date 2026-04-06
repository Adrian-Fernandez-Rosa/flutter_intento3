// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> { //notar qque es privado
  String? selectedGender;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector()
      ],
    );
  }
}