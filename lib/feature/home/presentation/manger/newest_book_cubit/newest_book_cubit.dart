import 'package:bookly_app_clean_architecture/feature/home/domain/use_cases/featch_newest_book_use_case.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/newest_book_cubit/newest_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit({required this.featchNewestBookUseCase})
    : super(NewestBookInitial());

  final FeatchNewestBookUseCase featchNewestBookUseCase;

  Future<void> featchNewestBook({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBookLoading());
    } else {
      emit(NewestBookPaginationLoading());
    }

    final result = await featchNewestBookUseCase.call(pageNumber);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(NewestBookFailure(errMassege: failure.errMessage));
        } else {
          emit(NewestBookPaginationFailure(errMassege: failure.errMessage));
        }
      },
      (books) {
        emit(NewestBookSuccess(books: books));
      },
    );
  }
}
