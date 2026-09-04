import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';

abstract class HomeRemoteDataSources {
  Future<List<BookEntity>> featchFeatureBook();
  Future<List<BookEntity>> featchNewestBook();
}
 class HomeRemoteDataSourcesImpl extends HomeRemoteDataSources{
  @override
  Future<List<BookEntity>> featchFeatureBook() {
    // TODO: implement featchFeatureBook
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> featchNewestBook() {
    // TODO: implement featchNewestBook
    throw UnimplementedError();
  }

 }
