import 'package:bookly_app_clean_architecture/core/utils/constant.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/book_details/widget/custoum_appbar_book_details.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimeryColour,
        body: Column(children: [const CustoumAppbarBookDetails()]),
      ),
    );
  }
}
