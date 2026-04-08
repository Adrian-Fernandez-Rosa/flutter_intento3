// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {

  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
        //Uomo
        Container(
          decoration: BoxDecoration(
            // color: Colors.red,

          color: selectedGender == "Hombre"
          ? AppColors.backgroundComponentSelected
          : AppColors.backgroundComponent,
            
            borderRadius: BorderRadius.circular(16)
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Image.asset("assets/images/male.png", height: 100,),
                SizedBox(height: 8,), // Tambien se podia haber usado un padding top
                Text("Hombre".toUpperCase(), 
                style: TextStyles.bodyText)
              ],
            ),
          ),
        ),

      //Donna
        Container(
          decoration: BoxDecoration(
            // color: Colors.red,

          color: selectedGender == "Mujer"
          ? AppColors.backgroundComponentSelected
          : AppColors.backgroundComponent,
            
            borderRadius: BorderRadius.circular(16)
            ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
            
                 Image.asset("assets/images/female.png", height: 100,),
                SizedBox(height: 8,),
                Text("Mujer".toUpperCase(), 
                style: TextStyles.bodyText) //nota que repetimos el mismo Texstyle de mas arriba
            
              ],
            ),
          ),
        )
      ],
    );
  }
}