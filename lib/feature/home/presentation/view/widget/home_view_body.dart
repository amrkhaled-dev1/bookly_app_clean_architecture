import 'package:bookly_app_clean_architecture/core/utils/constant.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/custoum_appbar.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/feature_list_view_bloc_consumer.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/newest_list_view_block_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final ScrollController _scrollController;

  int nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll >= maxScroll * 0.7) {
      if (!isLoading) {
        isLoading = true;

        await context.read<NewestBookCubit>().featchNewestBook(
          pageNumber: nextPage,
        );

        nextPage++;

        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimeryColour,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustoumAppBar(),
                    const SizedBox(height: 20),
                    const FeatureListViewBlocConsumer(),
                    const SizedBox(height: 15),
                    const Text(
                      'Newest Book',
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

            const NewestListViewBlockConsumer(),
          ],
        ),
      ),
    );
  }
}