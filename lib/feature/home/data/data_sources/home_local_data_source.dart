import 'package:bookly_app_clean_architecture/core/utils/constant.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> featchFeatureBook();
  List<BookEntity> featchNewestBook();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntity> featchFeatureBook() {
    var box = Hive.box<BookEntity>(kFeatureBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> featchNewestBook() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
