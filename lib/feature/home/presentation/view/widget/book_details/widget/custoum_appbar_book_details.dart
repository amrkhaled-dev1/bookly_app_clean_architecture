import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustoumAppbarBookDetails extends StatelessWidget {
  const CustoumAppbarBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.close, color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.bookmark, color: Colors.white),
        ),
      ],
    );
  }
}
