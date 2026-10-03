import 'package:bookly_app_clean_architecture/core/utils/constant.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> featchFeatureBook({int pageNumber = 0});
  List<BookEntity> featchNewestBook();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntity> featchFeatureBook({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kFeatureBox);
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    int length = box.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> featchNewestBook({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kNewestBox);
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    int length = box.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
