import 'package:flutter/material.dart';

class CustoumTextButton extends StatelessWidget {
  const CustoumTextButton({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.borderRadius,
    required this.textStyle,
    this.onPressed,
  });
  final Color backgroundColor;

  final String text;
  final BorderRadius borderRadius;
  final TextStyle textStyle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        onPressed: onPressed,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
