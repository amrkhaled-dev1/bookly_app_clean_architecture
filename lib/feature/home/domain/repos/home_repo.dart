import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';

abstract class HomeRepo {
  Future<List<BookEntity>> featchFeatureBook();
  Future<List<BookEntity>> featchNewestBook();
}
