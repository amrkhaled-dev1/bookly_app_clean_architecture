import 'package:bookly_app_clean_architecture/core/widget/custoum_book_image.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/feature_book_cubit/feature_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FutureListView extends StatefulWidget {
  const FutureListView({
    super.key,
    required this.books,
    this.onFetchMore,
    this.isLoading = false,
  });

  final List<BookEntity> books;
  final VoidCallback? onFetchMore;
  final bool isLoading;

  @override
  State<FutureListView> createState() => _FutureListViewState();
}

class _FutureListViewState extends State<FutureListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll >= (maxScroll * 0.7) && !widget.isLoading) {
      BlocProvider.of<FeatureBookCubit>(
        context,
      ).featchFeatureBook(pageNumber: nextPage++);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CustoumBookImage(image: widget.books[index].image ?? ''),
          );
        },
      ),
    );
  }
}
