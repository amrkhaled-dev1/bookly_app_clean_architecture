import 'package:bookly_app_clean_architecture/core/widget/custoum_book_image.dart';
import 'package:flutter/material.dart';

class SimilerBookListView extends StatelessWidget {
  const SimilerBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 2),
            child: CustoumBookImage(image: 'https://img.magnific.com/free-vector/hand-drawn-flat-design-stack-books-illustration_23-2149341898.jpg?semt=ais_hybrid&w=740&q=80',),
          );
        },
      ),
    );
  }
}
