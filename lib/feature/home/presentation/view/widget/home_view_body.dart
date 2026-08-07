import 'package:bookly_app_clean_architecture/core/utils/constant.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/custoum_appbar.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/custoum_book_details.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/future_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimeryColour,
      body: SafeArea(
        child: Column(
          children: [
            const CustoumAppBar(),
            const SizedBox(height: 20),
            const FutureListView(),
            const CustoumBookDetails(),
          ],
        ),
      ),
    );
  }
}
