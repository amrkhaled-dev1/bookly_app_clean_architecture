import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/newest_item.dart';
import 'package:flutter/material.dart';

class NewestListView extends StatelessWidget {
  const NewestListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 10.0),
          child: NewestItem(books: books[index]),
        );
      }, childCount: books.length),
    );
  }
}
