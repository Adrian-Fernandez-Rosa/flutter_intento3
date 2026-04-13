import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class NumberSelector extends StatefulWidget {

  final String title;

  const NumberSelector({super.key, required this.title});

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    
    return Container(

      decoration: BoxDecoration(
        color: AppColors.backgroundComponent,
        borderRadius: BorderRadius.circular(16)
      ), // Notar que el decoration se esta usando mucho, hay que meterlo como componente

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(widget.title, style: TextStyles.bodyText,),
            Text(""),
            Row(
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.remove, color: Colors.white,),
                ),
                SizedBox(width: 16,),
                   FloatingActionButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.add, color: Colors.white,),
                ),
               // FloatingActionButton(onPressed: (){}, shape: CircleBorder())
              ],
            )
          ],
        ),
      ),
    );
  }
}