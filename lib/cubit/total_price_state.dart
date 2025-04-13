part of 'total_price_cubit.dart';

abstract class TotalPriceState {}

class TotalPriceInitial extends TotalPriceState {}

class TotalPriceUpdated extends TotalPriceState {
  final double subTotal;
  final double delivery;
  final double discount;
  final double total;

  TotalPriceUpdated({
    required this.subTotal,
    required this.delivery,
    required this.discount,
    required this.total,
  });
}
