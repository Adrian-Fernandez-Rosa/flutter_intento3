// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:imc_calculator/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
        //Uomo
        Column(
          children: [
            Image.asset("assets/images/male.png", height: 100,),
            Text("Hombre".toUpperCase(), 
            style: TextStyles.bodyText)
          ],
        ),

      //Donna
        Column(
          children: [

             Image.asset("assets/images/female.png", height: 100,),
            Text("Mujer".toUpperCase(), 
            style: TextStyles.bodyText) //nota que repetimos el mismo Texstyle de mas arriba

          ],
        )
      ],
    );
  }
}