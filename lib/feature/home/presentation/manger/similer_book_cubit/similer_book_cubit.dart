
import 'package:bookly_app_clean_architecture/feature/home/presentation/manger/similer_book_cubit/similer_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilerBookCubit extends Cubit<SimilerBookState> {
  SimilerBookCubit() : super(SimilerBookInitial());
  
}
