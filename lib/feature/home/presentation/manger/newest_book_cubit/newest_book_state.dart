import 'package:bookly_app_clean_architecture/feature/home/domain/entity/book_entity.dart';

class NewestBookState {}

final class NewestBookInitial extends NewestBookState {}

final class NewestBookLoading extends NewestBookState {}

final class NewestBookSuccess extends NewestBookState {
  final List<BookEntity> books;

  NewestBookSuccess({required this.books});
}

final class NewestBookPaginationLoading extends NewestBookState {}

final class NewestBookPaginationFailure extends NewestBookState {
  final String errMassege;

  NewestBookPaginationFailure({required this.errMassege});
}

final class NewestBookFailure extends NewestBookState {
  final String errMassege;

  NewestBookFailure({required this.errMassege});
}
