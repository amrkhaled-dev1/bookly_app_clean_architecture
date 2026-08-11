import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/custoum_book_rating.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'The Jungle Book',
          style: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Rudyard Kipling',
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
