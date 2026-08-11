import 'package:flutter/material.dart';

class CustoumTextFiled extends StatelessWidget {
  CustoumTextFiled({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      onSubmitted: (value) {},
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Search books...',
        hintStyle: TextStyle(color: Colors.white),

        suffixIcon: const Icon(Icons.search, color: Colors.white),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
