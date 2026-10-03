import 'package:bookly_app_clean_architecture/core/widget/custoum_book_image.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:flutter/material.dart';

class SimilerBookListView extends StatelessWidget {
  const SimilerBookListView({super.key, required this.books});
  final BookEntity books;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 2),
            child: CustoumBookImage(image: books.image ?? "", book: books),
          );
        },
      ),
    );
  }
}
