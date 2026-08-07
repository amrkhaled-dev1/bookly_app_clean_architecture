import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AnimateDo extends StatelessWidget {
  const AnimateDo({super.key});

  @override
  Widget build(BuildContext context) {
    return BackInUp(
      duration: const Duration(seconds: 2),
      child: const Text(
        'Read Free Books',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
