import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/custoum_book_rating.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.books});
  final BookEntity books;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          books.title,
          style: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          books.authorName ?? "",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8),
        const CustoumBookRaiting(),
      ],
    );
  }
}
