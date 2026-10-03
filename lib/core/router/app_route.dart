import 'package:bookly_app_clean_architecture/core/router/route_name.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/home_view.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/view/widget/book_details/book_details_view.dart';
import 'package:bookly_app_clean_architecture/feature/search/presentation/view/search_view.dart';
import 'package:bookly_app_clean_architecture/feature/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoute {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RouteName.kSplashView,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: RouteName.kHomeView,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: RouteName.kHomeViewDetails,
        builder: (context, state) {
          final books = state.extra as BookEntity;
          return BookDetailsView(books: books);
        },
      ),
      GoRoute(
        path: RouteName.kSearchView,
        builder: (context, state) => SearchView(),
      ),
    ],
  );
}
