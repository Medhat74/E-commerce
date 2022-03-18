part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductSuccessState extends ProductState {}

class ProductErrorState extends ProductState {
  final error;
  ProductErrorState(this.error);
}

class ProductLoadingState extends ProductState {}