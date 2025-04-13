import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'hide_bottom_appbar_state.dart';

class HideBottomAppbarCubit extends Cubit<HideBottomAppbarState> {
  HideBottomAppbarCubit() : super(HideBottomAppbarState(isVisible: true)) {
    scrollController.addListener(() {
      checkScroll(scrollController.position.pixels);
    });
  }

  final ScrollController scrollController = ScrollController();

  void checkScroll(double scrollPosition) {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 50) {
      emit(HideBottomAppbarState(isVisible: false));
    } else {
      emit(HideBottomAppbarState(isVisible: true));
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
