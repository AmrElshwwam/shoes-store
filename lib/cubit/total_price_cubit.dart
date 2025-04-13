import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/model/shoes_model.dart';

part 'total_price_state.dart';

class TotalPriceCubit extends Cubit<TotalPriceState> {
  double subTotal = 0, delivery = 10, discount = 0, total = 0;

  final List<ShoesModel> dataShoes; //  استدعاء القائمة عند إنشاء الكيوبت

  TotalPriceCubit({required this.dataShoes}) : super(TotalPriceInitial());

  void updateTotal(Map<String, int> productCounts) {
    subTotal = productCounts.entries.fold(
        0, (sum, entry) => sum + (entry.value * getProductPrice(entry.key)));

    discount = subTotal > 100 ? subTotal * 0.1 : 0; // خصم 10% إذا تجاوز 100
    total = (subTotal - discount) + delivery;

    emit(TotalPriceUpdated(
      subTotal: subTotal,
      delivery: delivery,
      discount: discount,
      total: total,
    ));
  }

  double getProductPrice(String shoesName) {
    final product = dataShoes.firstWhere(
      (shoes) => shoes.shoesName == shoesName,
      orElse: () => ShoesModel(
        shoesName: "",
        shoesPrice: 50,
        shoesImage: [],
        shoesSize: [],
        indexShoesModel: 0,
        indexShoesSize: 0,
      ),
    );
    return product.shoesPrice;
  }
}
