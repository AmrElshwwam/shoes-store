import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'change_size_shoes_state.dart';

class ChangeSizeShoesCubit extends Cubit<ChangeSizeShoesState> {
  int indexSizeShoes = 0;
  ChangeSizeShoesCubit() : super(ChangeSizeShoesInitial());

  void updateIndexModelShoes(int indexSize) {
    indexSizeShoes = indexSize;
    emit(ChangedSizeShoesState(indexSizeShoes: indexSize));
  }
}
