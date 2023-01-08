part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartLoad extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartAdd extends CartEvent {
  final CartItem cartItem;

  const CartAdd({required this.cartItem});

  @override
  List<Object> get props => [cartItem];
}

class CartRemove extends CartEvent {
  final CartItem cartItem;

  const CartRemove({required this.cartItem});

  @override
  List<Object> get props => [cartItem];
}
