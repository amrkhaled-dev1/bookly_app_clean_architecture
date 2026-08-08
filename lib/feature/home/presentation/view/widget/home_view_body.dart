import 'package:bookly_app_clean_architecture/core/utils/constant.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/best_seller_item.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/best_seller_list_view.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/custoum_appbar.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/future_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimeryColour,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustoumAppBar(),
                    const SizedBox(height: 20),
                    const FutureListView(),
                    const SizedBox(height: 15),
                    const Text(
                      'Best Seller',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            BestSellerListView(),
          ],
        ),
      ),
    );
  }
}
