import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/data/shoes_data.dart';
import 'package:shoes_store/model/shoes_model.dart';

// import 'package:meta/meta.dart';

part 'searching_state.dart';

class SearchingCubit extends Cubit<SearchingState> {
  TextEditingController controllerSearching = TextEditingController();
  List<ShoesModel> searchedShoes = [];

  SearchingCubit() : super(SearchingInitial());

  getSearchingShoes(String nameShoes) {
    searchedShoes = dataShoes
        .where((shoes) =>
            shoes.shoesName.toLowerCase().contains(nameShoes.toLowerCase()))
        .toList();

    if (searchedShoes.isEmpty || controllerSearching.text.isEmpty) {
      emit(SearchingInitial()); // عند عدم العثور على نتائج
    } else {
      emit(SearchingNowState(lstShoes: searchedShoes)); // عرض النتائج
    }
  }
}
