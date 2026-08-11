import 'package:bookly_app_clean_architecture/core/router/route_name.dart';
import 'package:bookly_app_clean_architecture/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustoumBookImage extends StatelessWidget {
  const CustoumBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RouteName.kHomeViewDetails);
      },
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(AssetsData.kTestImage, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
