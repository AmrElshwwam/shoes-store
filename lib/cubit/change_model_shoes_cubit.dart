import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

part 'change_model_shoes_state.dart';

class ChangeModelShoesCubit extends Cubit<ChangeModelShoesState> {
  int indexModelShoes = 0;
  ChangeModelShoesCubit() : super(ChangeModelShoesInitial());

  void updateIndexModelShoes(int indexModel) {
    indexModelShoes = indexModel;
    emit(ChangedModelShoesState(indexModelShoes: indexModel));
  }
}
