import 'package:bookly_app_clean_architecture/core/errors/failure.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, List<BookEntity>>> featchFeatureBook() {
    // TODO: implement featchFeatureBook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookEntity>>> featchNewestBook() {
    // TODO: implement featchNewestBook
    throw UnimplementedError();
  }
}
