import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  GradientContainer({
    required this.child,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFDF5A1), Color(0xFFF2D4E9)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(2, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: child,
    );
  }
}