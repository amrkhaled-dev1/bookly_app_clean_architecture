import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/newest_book_cubit/newest_book_state.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/newest_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListViewBlockConsumer extends StatelessWidget {
  const NewestListViewBlockConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBookCubit, NewestBookState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is NewestBookSuccess) {
          return NewestListView(books: state.books);
        }

        if (state is NewestBookFailure) {
          return SliverToBoxAdapter(child: Text(state.errMassege));
        }

        return const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
