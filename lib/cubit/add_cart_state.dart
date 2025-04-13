

part of 'add_cart_cubit.dart';

// @immutable
sealed class AddCartState {}

final class AddCartInitial extends AddCartState {}

final class UpdatedCartState extends AddCartState {
  final List<ShoesModel> dataShoes;

  UpdatedCartState({required this.dataShoes});
}
