part of 'count_product_cart_cubit.dart';

// @immutable
sealed class CountProductCartState {}

final class CountProductCartInitial extends CountProductCartState {}

final class UpdateProductCartState extends CountProductCartState {
  final Map<String, int> productCounts;
  UpdateProductCartState({required this.productCounts});
}
