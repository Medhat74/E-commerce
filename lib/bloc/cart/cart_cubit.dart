import 'package:bloc/bloc.dart';
import 'package:e_commercy/models/product_hub.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context)=>BlocProvider.of(context);
  List<ProductHub> productsCart = [];

  void addToCart(ProductHub product){
    if (productsCart.length == 0) {
      productsCart.add(product);
    }

    else{
      bool found = false;
      for(int i = 0 ; i  <productsCart.length; i++){
        if (productsCart[i].data![0].id == product.data![i].id){
          found = true;
          productsCart[i].data![0].ordaredCategory++;
          break;
        }
      }
      if(!found){
        productsCart.add(product);
      }
    }

    emit(CartAddSuccessState());
  }

  void removeCart(){

  }


}
