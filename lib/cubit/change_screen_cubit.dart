import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'change_screen_state.dart';

class ChangeScreenCubit extends Cubit<ChangeScreenState> {
  ChangeScreenCubit() : super(ChangeScreenInitial());

  void updateIndexScreen(int index) {
    emit(UpdatedScreenState(currentScreen: index));
  }
}
