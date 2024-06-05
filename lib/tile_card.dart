
import 'package:bright_infonet_task/food_model.dart';
import 'package:bright_infonet_task/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Tile extends StatelessWidget {
  final int index;
  final double extent;

  const Tile({Key? key, required this.index, required this.extent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return index==0? SizedBox(
      height: 100,
      child: Center(
        child: Text('Found 80 results',
          textAlign: TextAlign.center,
          style: GoogleFonts.aBeeZee(color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24),),
      ),
    ):
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Card(
        color: Colors.white,
        elevation: 0.3,
        child: SizedBox(
          width: extent,
          height: extent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  foodList[index - 1].imageAddress,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                foodList[index - 1].foodName,
                style:  GoogleFonts.aBeeZee(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w700),
              ),
              Text(
                foodList[index - 1].description,
                style: GoogleFonts.aBeeZee(color: Colors.black38, fontSize: 14,fontWeight: FontWeight.w300),
              ),
              Text(
                '🔥 ${foodList[index - 1].calories} Calories',
                style: GoogleFonts.aBeeZee(color: Colors.redAccent.shade400, fontSize: 14,fontWeight: FontWeight.w500),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 22),
                  children: [
                    TextSpan(
                      text: '\$ ',
                      style: TextStyle(color: Colors.yellow.shade700, fontSize: 14),
                    ),
                    TextSpan(
                      text: foodList[index - 1].price.toString(),
                      style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
