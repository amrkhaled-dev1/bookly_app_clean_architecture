import 'package:bookly_app_clean_architecture/core/router/route_name.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustoumBookImage extends StatelessWidget {
  final BookEntity book;
  final String image;
  const CustoumBookImage({super.key, required this.image, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RouteName.kHomeViewDetails, extra: book);
      },
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: CachedNetworkImage(imageUrl: image),
        ),
      ),
    );
  }
}
