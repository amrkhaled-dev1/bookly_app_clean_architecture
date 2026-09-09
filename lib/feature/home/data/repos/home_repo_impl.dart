import 'package:bookly_app_clean_architecture/core/errors/failure.dart';
import 'package:bookly_app_clean_architecture/feature/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app_clean_architecture/feature/home/data/data_sources/home_remote_data_sources.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSources homeRemoteDataSources;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSources,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> featchFeatureBook() async {
    try {
      var booksList = homeLocalDataSource.featchFeatureBook();

      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteDataSources.featchFeatureBook();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> featchNewestBook() async {
    try {
      var booksList = homeLocalDataSource.featchNewestBook();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteDataSources.featchNewestBook();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
