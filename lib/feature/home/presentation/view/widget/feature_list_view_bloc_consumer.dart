import 'package:bookly_app_clean_architecture/core/widget/custom_progress_indicator.dart';
import 'package:bookly_app_clean_architecture/core/widget/custom_top_snack_bar.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/feature_book_cubit/feature_book_cubit.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/feature_book_cubit/feature_book_state.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/future_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureListViewBlocConsumer extends StatefulWidget {
  const FeatureListViewBlocConsumer({super.key});

  @override
  State<FeatureListViewBlocConsumer> createState() =>
      _FeatureListViewBlocConsumerState();
}

class _FeatureListViewBlocConsumerState
    extends State<FeatureListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureBookCubit, FeatureBookState>(
      listener: (context, state) {
        if (state is FeatureBookSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FeatureBookSuccess ||
            state is FeatureBookPaginationLoading ||
            state is FeatureBookPaginationFailure) {
          return FutureListView(books: books);
        } else if (state is FeatureBookFailure) {
          CustomTopSnackBar.show(
            context,
            title: "Erorr",
            message: state.errMassege,
            icon: Icons.error_outline,
            backgroundColor: Colors.red,
          );
          return FutureListView(books: books);
        } else {
          return CustomProgressIndicator();
        }
      },
    );
  }
}
