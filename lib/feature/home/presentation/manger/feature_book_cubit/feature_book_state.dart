import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';

class FeatureBookState {}

final class FeatureBookInitial extends FeatureBookState {}

final class FeatureBookSuccess extends FeatureBookState {
  final List<BookEntity> books;

  FeatureBookSuccess({required this.books});
}

final class FeatureBookLoading extends FeatureBookState {}

final class FeatureBookPaginationLoading extends FeatureBookState {}

final class FeatureBookPaginationFailure extends FeatureBookState {
   final String errMassege;

  FeatureBookPaginationFailure({required this.errMassege});
}

final class FeatureBookFailure extends FeatureBookState {
  final String errMassege;

  FeatureBookFailure({required this.errMassege});
}
