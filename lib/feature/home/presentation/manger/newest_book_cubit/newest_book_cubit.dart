import 'package:bookly_app_clean_architecture/feature/home/domain/use_cases/featch_newest_book_use_case.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/newest_book_cubit/newest_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit({required this.featchNewestBookUseCase})
    : super(NewestBookInitial());
  final FeatchNewestBookUseCase featchNewestBookUseCase;
  Future<void> featchNewestBook() async {
    var result = await featchNewestBookUseCase.call();
    emit(NewestBookLoading());
    result.fold(
      (failure) {
        emit(NewestBookFailure(errMassege: failure.errMessage));
      },
      (books) {
        emit(NewestBookSuccess(books: books));
      },
    );
  }
}
