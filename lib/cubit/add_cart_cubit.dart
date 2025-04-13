import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/cubit/count_product_cart_cubit.dart';
import 'package:shoes_store/cubit/total_price_cubit.dart';
import 'package:shoes_store/model/shoes_model.dart';

part 'add_cart_state.dart';

class AddCartCubit extends Cubit<AddCartState> {
  final CountProductCartCubit countCubit;
  final TotalPriceCubit totalPriceCubit;
  List<ShoesModel> dataShoes = [];

  AddCartCubit({
    required this.countCubit,
    required this.totalPriceCubit,
  }) : super(AddCartInitial());

  void addProductCart(
    String shoesName,
    double shoesPrice,
    String shoesImage,
    String shoesSize,
  ) {
    dataShoes.add(
      ShoesModel(
        shoesName: shoesName,
        shoesPrice: shoesPrice,
        shoesImage: [shoesImage],
        shoesSize: [shoesSize],
        indexShoesModel: 0,
        indexShoesSize: 0,
      ),
    );

    countCubit.productCounts[shoesName] =
        (countCubit.productCounts[shoesName] ?? 0) + 1;

    totalPriceCubit.updateTotal(countCubit.productCounts);
    emit(UpdatedCartState(dataShoes: List.from(dataShoes)));
  }

  void removeProductCart(String shoesName) {
    dataShoes.removeWhere((item) => item.shoesName == shoesName);
    countCubit.removeProductCart(shoesName);

    emit(dataShoes.isEmpty
        ? AddCartInitial()
        : UpdatedCartState(dataShoes: List.from(dataShoes)));
  }
}
