part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}


class CategorySuccessState extends CategoryState {


}

class CategoryErrorState extends CategoryState {
  final error;

  CategoryErrorState(this.error);
}

class CategoryLoadingState extends CategoryState {}