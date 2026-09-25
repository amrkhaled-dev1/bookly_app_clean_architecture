import 'package:bookly_app_clean_architecture/feature/home/domain/use_cases/featch_featured_book_use_case.dart';
import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/feature_book_cubit/feature_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBookCubit extends Cubit<FeatureBookState> {
  FeatureBookCubit({required this.featchFeaturedBookUseCase})
    : super(FeatureBookInitial());
  final FeatchFeaturedBookUseCase featchFeaturedBookUseCase;
  Future<void> featchFeatureBook({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeatureBookLoading());
    } else {
      emit(FeatureBookPaginationLoading());
    }
    var result = await featchFeaturedBookUseCase.call(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeatureBookFailure(errMassege: failure.errMessage));
        } else {
          emit(FeatureBookPaginationFailure(errMassege: failure.errMessage));
        }
      },
      (books) {
        emit(FeatureBookSuccess(books: books));
      },
    );
  }
}
