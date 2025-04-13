part of 'change_size_shoes_cubit.dart';

@immutable
sealed class ChangeSizeShoesState {}

final class ChangeSizeShoesInitial extends ChangeSizeShoesState {}

final class ChangedSizeShoesState extends ChangeSizeShoesState {
  final int indexSizeShoes;
  ChangedSizeShoesState({required this.indexSizeShoes});
}
