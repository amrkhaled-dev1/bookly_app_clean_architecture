import 'package:bookly_app_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustoumAppBar extends StatelessWidget {
  const CustoumAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            width: 100,
            height: 30,
            child: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Image.asset(AssetsData.kLogo),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: Colors.white, size: 32),
        ),
      ],
    );
  }
}
