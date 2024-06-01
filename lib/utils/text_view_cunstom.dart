
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final String firstText;
  final String secondText;
  final TextStyle? firstTextStyle;
  final TextStyle? secondTextStyle;

  CustomRichText({
    required this.text,
    required this.firstText,
    required this.secondText,
    this.firstTextStyle,
    this.secondTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              color: Color(0xFF141414),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.ibmPlexSans().fontFamily),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: firstText,
                style: firstTextStyle ??
                    TextStyle(
                        color: Color(0xFF141414),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.ibmPlexSans().fontFamily),
              ),
              TextSpan(
                text: secondText,
                style: secondTextStyle ??
                    TextStyle(
                        color: Color(0xFF141414),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.ibmPlexSans().fontFamily),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
