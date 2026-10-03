import 'package:bookly_app_clean_architecture/core/widget/custom_progress_indicator.dart';
import 'package:bookly_app_clean_architecture/core/widget/custom_top_snack_bar.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/newest_book_cubit/newest_book_state.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/newest_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListViewBlockConsumer extends StatefulWidget {
  const NewestListViewBlockConsumer({super.key});

  @override
  State<NewestListViewBlockConsumer> createState() =>
      _NewestListViewBlockConsumerState();
}

class _NewestListViewBlockConsumerState
    extends State<NewestListViewBlockConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBookCubit, NewestBookState>(
      listener: (context, state) {
        if (state is NewestBookSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is NewestBookSuccess ||
            state is NewestBookPaginationLoading ||
            state is NewestBookPaginationFailure) {
          return NewestListView(
            books: books,
          );
        }

        if (state is NewestBookFailure) {
          CustomTopSnackBar.show(
            context,
            title: 'Error',
            message: state.errMassege,
            icon: Icons.error_outline,
            backgroundColor: Colors.red,
          );

          return NewestListView(
            books: books,
          );
        }

        return const SliverToBoxAdapter(
          child: Center(
            child: CustomProgressIndicator(),
          ),
        );
      },
    );
  }
}