import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final double fontSize;
  final FontWeight fontWeight;

  GradientText({
    required this.text,
    required this.gradient,
    required this.fontSize ,
    required this.fontWeight ,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.white,
        ),
      ),
    );
  }
}