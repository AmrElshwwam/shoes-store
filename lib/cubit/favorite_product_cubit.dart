import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/model/shoes_model.dart';


part 'favorite_product_state.dart';

class FavoriteProductCubit extends Cubit<FavoriteProductState> {
  List<ShoesModel> lstProduct = [];
  // int indexShoesModel = 0;
  FavoriteProductCubit() : super(FavoriteProductInitial());

  void addFavorite(ShoesModel product) {
    lstProduct.add(product);
    // indexShoesModel = getIndexShoesModel;

    emit(
      UpdatedFavoriteState(
        lstFavorite: lstProduct,
        // indexShoesModel: indexShoesModel,
      ),
    );
  }

  void removeFavorite(ShoesModel product) {
    int indexProduct = lstProduct
        .indexWhere((favProduct) => product.shoesName == favProduct.shoesName);
    if (indexProduct != -1) {
      // print("تم العثور على المنتج وسيتم حذفه");
      // print(product.shoesName);
      lstProduct.removeAt(indexProduct);
      if (lstProduct.isEmpty) {
        emit(FavoriteProductInitial());
      } else {
        //  print("لم يتم العثور على المنتج، هناك مشكلة في مقارنة البيانات");
        emit(UpdatedFavoriteState(lstFavorite: lstProduct));
      }
    }
    // else{ print("لم يتم العثور على المنتج، هناك مشكلة في مقارنة البيانات");}
  }

  void updateModelProduct(String productName, int getIndexShoesModel) {
    int indexProduct =
        lstProduct.indexWhere((product) => product.shoesName == productName);

    if (indexProduct != -1) {
      lstProduct[indexProduct] = lstProduct[indexProduct]
          .copyWith(indexShoesModel: getIndexShoesModel);
      emit(UpdatedFavoriteState(
        lstFavorite: lstProduct,
      ));
    }
  }

  void updateSizeProduct(String productName, int getIndexShoesSize) {
    int indexProduct =
        lstProduct.indexWhere((product) => product.shoesName == productName);

    if (indexProduct != -1) {
      lstProduct[indexProduct] =
          lstProduct[indexProduct].copyWith(indexShoesSize: getIndexShoesSize);
      emit(UpdatedFavoriteState(
        lstFavorite: lstProduct,
      ));
    }
  }
}
