import 'package:bookly_app_clean_architecture/core/utils/assets.dart';
import 'package:bookly_app_clean_architecture/core/utils/constant.dart';
import 'package:bookly_app_clean_architecture/feature/search/presentation/view/widget/custoum_text_filed.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimeryColour,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CustoumTextFiled(),
              SizedBox(height: 20),
              Image.asset(AssetsData.kSearchImage),
            ],
          ),
        ),
      ),
    );
  }
}
