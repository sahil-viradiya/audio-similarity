import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomContainer extends StatelessWidget {
  final String svgPath;
  final String text;
  final double svgSize;
  final TextStyle textStyle;

  CustomContainer({
    required this.svgPath,
    required this.text,
    this.svgSize = 50.0,
    this.textStyle = const TextStyle(fontSize: 16.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: 90,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xFF5130FC),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            svgPath,
          ),
          SizedBox(height: 4.0),
          Text(
            text,
            maxLines: 3,
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
              color: const Color(0xFFECCAFF)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}