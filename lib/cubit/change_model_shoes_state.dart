part of 'change_model_shoes_cubit.dart';

// @immutable
sealed class ChangeModelShoesState {}

final class ChangeModelShoesInitial extends ChangeModelShoesState {}

final class ChangedModelShoesState extends ChangeModelShoesState {
  final int indexModelShoes;
  ChangedModelShoesState({required this.indexModelShoes});
}
