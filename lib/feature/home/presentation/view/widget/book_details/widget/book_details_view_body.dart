import 'package:bookly_app_clean_architecture/core/utils/constant.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/book_details/widget/book_action.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/book_details/widget/book_details_section.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/book_details/widget/custom_section_title.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/book_details/widget/custoum_appbar_book_details.dart';
import 'package:bookly_app_clean_architecture/core/widget/custoum_book_image.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/book_details/widget/similer_book_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.books});
  final BookEntity books;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimeryColour,
        body: Column(
          children: [
            const CustoumAppbarBookDetails(),
            SizedBox(
              height: 300,
              child: CustoumBookImage(image: books.image ?? "", book: books),
            ),
            const SizedBox(height: 20),

            BookDetailsSection(books: books),
            const SizedBox(height: 20),
            const BookAction(),
            const CustomSectionTitle(),
            SimilerBookListView(books: books),
          ],
        ),
      ),
    );
  }
}
