
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/cubit/total_price_cubit.dart';

part 'count_product_cart_state.dart';

class CountProductCartCubit extends Cubit<CountProductCartState> {
  final TotalPriceCubit totalPriceCubit;
  Map<String, int> productCounts = {};

  CountProductCartCubit({
    required this.totalPriceCubit,
  }) : super(CountProductCartInitial());

  
  void increaseProductCart(String shoesName) {
    
    productCounts[shoesName] = (productCounts[shoesName] ?? 0) + 1;
    emit(UpdateProductCartState(productCounts: Map.from(productCounts)));
    totalPriceCubit.updateTotal(productCounts);
  }

  void decreaseProductCart(String shoesName) {
    if (productCounts.containsKey(shoesName) && productCounts[shoesName]! > 1) {
      productCounts[shoesName] = productCounts[shoesName]! - 1;
      emit(UpdateProductCartState(productCounts: Map.from(productCounts)));
      totalPriceCubit.updateTotal(productCounts);
    }
  }

  void removeProductCart(String shoesName) {
    if (productCounts.containsKey(shoesName) &&
        productCounts[shoesName]! >= 1) {
      productCounts.remove(shoesName);

      emit(UpdateProductCartState(productCounts: Map.from(productCounts)));
      totalPriceCubit.updateTotal(productCounts);
    }
  }

}
