import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> featchFeatureBook();
  List<BookEntity> featchNewestBook();
}
 class HomeLocalDataSourceImp extends HomeLocalDataSource{
  @override
  List<BookEntity> featchFeatureBook() {
    // TODO: implement featchFeatureBook
    throw UnimplementedError();
  }

  @override
  List<BookEntity> featchNewestBook() {
    // TODO: implement featchNewestBook
    throw UnimplementedError();
  }

 }
