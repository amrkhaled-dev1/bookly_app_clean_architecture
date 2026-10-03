import 'package:bookly_app_clean_architecture/core/errors/failure.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> featchFeatureBook({
    int pageNumber = 0,
  });
  Future<Either<Failure, List<BookEntity>>> featchNewestBook({
    int pageNumber = 0,
  });
}
