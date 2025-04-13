import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

part 'visibility_Password_state.dart';


class VisibilityPasswordCubit extends Cubit<VisibilityPasswordState> {
  VisibilityPasswordCubit() : super(VisibilityPasswordInitial());

  void toggleVisibility() {
    if (state is UpdatedVisibilityPasswordState) {
      final currentState = state as UpdatedVisibilityPasswordState;
      emit(UpdatedVisibilityPasswordState(visibilityOn: !currentState.visibilityOn));
    } else {
      emit(UpdatedVisibilityPasswordState(visibilityOn: true));
    }
  }
}
