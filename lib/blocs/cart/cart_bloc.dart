import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartLoad>((event, emit) async {
      emit(const CartLoaded());
    });

    on<CartAdd>((event, emit) async {
      final currentState = state;
      if (currentState is CartLoaded) {
        emit(CartLoading());
        List<CartItem> cartItems = List.from(currentState.cart.cartItems);

        if (!cartItems.any(
            (element) => element.productName == event.cartItem.productName)) {
          cartItems.add(event.cartItem);
        } else {
          for (var i = 0; i < cartItems.length; i++) {
            if (cartItems[i].productName == event.cartItem.productName) {
              cartItems[i].quantity++;
            }
          }
        }
        emit(CartLoaded(cart: Cart(cartItems: cartItems)));
      }
    });

    on<CartRemove>((event, emit) async {
      final currentState = state;
      if (currentState is CartLoaded) {
        emit(CartLoading());
        List<CartItem> cartItems = List.from(currentState.cart.cartItems);

        if (cartItems
                .firstWhere((element) =>
                    element.productName == event.cartItem.productName)
                .quantity >
            1) {
          for (var i = 0; i < cartItems.length; i++) {
            if (cartItems[i].productName == event.cartItem.productName) {
              cartItems[i].quantity--;
            }
          }
        } else {
          cartItems.removeWhere(
              (element) => element.productName == event.cartItem.productName);
        }

        emit(CartLoaded(cart: Cart(cartItems: cartItems)));
      }
    });
  }
}
