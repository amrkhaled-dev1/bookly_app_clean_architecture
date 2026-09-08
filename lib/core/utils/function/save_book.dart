import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooks(List<BookEntity> books, String boxName) {
     var box = Hive.box(boxName);
    box.addAll(books);
  }