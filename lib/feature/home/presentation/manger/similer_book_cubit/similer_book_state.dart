abstract class SimilerBookState {}

final class SimilerBookInitial extends SimilerBookState {}

final class SimilerBookLoading extends SimilerBookState {}

final class SimilerBookFailure extends SimilerBookState {
  final String errMassege;

  SimilerBookFailure({required this.errMassege});
}

final class SimilerBookSuccess extends SimilerBookState {}
