import 'package:bookly_app_clean_architecture/core/errors/failure.dart';
import 'package:bookly_app_clean_architecture/core/use_cases/use_case.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';
import 'package:bookly_app_clean_architecture/feature/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FeatchFeaturedBookUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FeatchFeaturedBookUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber = 0]) async {
    return await homeRepo.featchFeatureBook(pageNumber: pageNumber);
  }
}
