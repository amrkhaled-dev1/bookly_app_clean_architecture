import 'package:bookly_app_clean_architecture/core/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    this.size = 35,
    this.strokeWidth = 3,
  });

  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          color: kPrimeryColour,
        ),
      ),
    );
  }
}