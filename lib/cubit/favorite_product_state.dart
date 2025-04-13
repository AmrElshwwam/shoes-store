part of 'favorite_product_cubit.dart';

// @immutable
sealed class FavoriteProductState {}

final class FavoriteProductInitial extends FavoriteProductState {}

final class UpdatedFavoriteState extends FavoriteProductState {
  final List<ShoesModel> lstFavorite;
  // final int? indexShoesModel;

  UpdatedFavoriteState({
    required this.lstFavorite,
    // this.indexShoesModel,
  });
}
