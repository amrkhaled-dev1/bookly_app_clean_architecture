import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/best_seller_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 10.0),
          child: BestSellerItem(),
        );
      }, childCount: 10),
    );
  }
}
