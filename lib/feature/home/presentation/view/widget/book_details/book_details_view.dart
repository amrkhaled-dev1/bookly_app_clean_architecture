import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/book_details/widget/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.books});
  final BookEntity books;

  @override
  Widget build(BuildContext context) {
    return  BookDetailsViewBody(books: books,);
  }
}
