import 'package:bookly_app_clean_architecture/core/router/app_route.dart';
import 'package:bookly_app_clean_architecture/core/utils/constant.dart';
import 'package:bookly_app_clean_architecture/core/utils/function/setup_service_locator.dart';
import 'package:bookly_app_clean_architecture/core/utils/simple_bloc_observer.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/use_cases/featch_featured_book_use_case.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/use_cases/featch_newest_book_use_case.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/feature_book_cubit/feature_book_cubit.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/newest_book_cubit/newest_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  await Hive.openBox<BookEntity>(kFeatureBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  Bloc.observer = SimpleBlocObserver();

  runApp(BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeatureBookCubit(
              featchFeaturedBookUseCase: getIt<FeatchFeaturedBookUseCase>(),
            )..featchFeatureBook();
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBookCubit(
              featchNewestBookUseCase: getIt<FeatchNewestBookUseCase>(),
            )..featchNewestBook();
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoute.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
