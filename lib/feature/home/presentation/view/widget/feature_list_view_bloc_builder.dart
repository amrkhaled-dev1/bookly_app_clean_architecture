import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/feature_book_cubit/feature_book_cubit.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/feature_book_cubit/feature_book_state.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/future_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureListViewBlockBuilder extends StatelessWidget {
  const FeatureListViewBlockBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBookCubit, FeatureBookState>(
      builder: (context, state) {
        if (state is FeatureBookSuccess) {
          return const FutureListView();
        } else if (state is FeatureBookFailure) {
          return Text(state.errMassege);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
