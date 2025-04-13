part of 'searching_cubit.dart';

// @immutable
sealed class SearchingState {}

final class SearchingInitial extends SearchingState {}

final class SearchingNowState extends SearchingState {
  final List<ShoesModel> lstShoes;

  SearchingNowState({required this.lstShoes});
}
