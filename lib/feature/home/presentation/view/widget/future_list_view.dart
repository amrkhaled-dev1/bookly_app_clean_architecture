import 'package:bookly_app_clean_architecture/core/widget/custoum_book_image.dart';
import 'package:flutter/material.dart';

class FutureListView extends StatelessWidget {
  const FutureListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: const CustoumBookImage(),
          );
        },
      ),
    );
  }
}
