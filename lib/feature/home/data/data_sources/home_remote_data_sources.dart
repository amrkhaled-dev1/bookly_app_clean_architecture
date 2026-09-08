import 'package:bookly_app_clean_architecture/core/utils/api_service.dart';
import 'package:bookly_app_clean_architecture/core/utils/constant.dart';
import 'package:bookly_app_clean_architecture/core/utils/function/save_book.dart';
import 'package:bookly_app_clean_architecture/feature/home/data/models/book_model/book_model/book_model.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';

abstract class HomeRemoteDataSources {
  Future<List<BookEntity>> featchFeatureBook();
  Future<List<BookEntity>> featchNewestBook();
}

class HomeRemoteDataSourcesImpl extends HomeRemoteDataSources {
  final ApiService apiService;

  HomeRemoteDataSourcesImpl({required this.apiService});
  @override
  Future<List<BookEntity>> featchFeatureBook() async {
    var data = await apiService.get(
      endPoint: "volumes?Filtering=free-ebooks&q=detective&",
    );
    List<BookEntity> books = getBookList(data);
    saveBooks(books, kFeatureBox);

    return books;
  }

  @override
  Future<List<BookEntity>> featchNewestBook() async {
    var data = await apiService.get(
      endPoint: "volumes?Filtering=free-ebooks&q=detective&Sorting=newset&",
    );
    List<BookEntity> books = getBookList(data);
    saveBooks(books, kNewestBox);

    return books;
  }
}

List<BookEntity> getBookList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var bookMap in data['items']) {
    books.add(BookModel.fromJson(bookMap));
  }
  return books;
}
