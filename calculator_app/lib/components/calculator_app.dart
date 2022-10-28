import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget calculatorButton({
  required String text,
  int value=0xFF171C22,
  Function? function ,
})=>Container(
    margin: const EdgeInsets.all(5),
    child: SizedBox(
      height: 70,
      width: 70,
      child: TextButton(
        onPressed: ()=>function!(text),
        style: TextButton.styleFrom(
          backgroundColor:Color(value),
          primary: Colors.white,
        ),
        child:Text(
          text,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );

Widget specialCalculatorButton({
  required String asset,
  Function? function,
})=>Container(
  margin: const EdgeInsets.all(5),
  child: SizedBox(
    height: 70,
    width: 70,
    child: ElevatedButton(
      onPressed: ()=>function!(asset),
      style: TextButton.styleFrom(
        backgroundColor:const Color(0xFF2E3A48),
      ),
      child: Tab(
        icon: Image.asset(
          asset,
          fit: BoxFit.cover,
          ),
    ),
  ),
 ),
);
