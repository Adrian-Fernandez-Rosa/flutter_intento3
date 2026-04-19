// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {

  final double selectedHeight;
  final Function(double) onHeightChange;


  const HeightSelector({super.key, required this.selectedHeight, required this.onHeightChange});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {

  // Variable para almacenar cm, el componente que vamos a usar solo acepta tipo de datos double.
 // double height = 220; // Altura inicial

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,  //lib/core/appColors
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Altura", style: TextStyles.bodyText,),
            ),
            Text("${widget.selectedHeight.toStringAsFixed(0)}  cm", 
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.bold)),
            Slider(value: widget.selectedHeight, onChanged: (nuevaAltura) {
        
             widget.onHeightChange(nuevaAltura);
            },
            // Cambiamos minimo y maximos del Slider porque por defecto solo acepta 0 y 1 
            min: 150,
            max: 220,
            divisions: 70, // es la cantidad de puntos que se frenara el slider
            label: "${widget.selectedHeight.toStringAsFixed(0)} cm",
            activeColor: AppColors.primary,
            )
          ],
        ),
      ),
    );
  }
}