import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/models/cart_item_model.dart';

import 'models.dart';

class Cart extends Equatable {
  final List<CartItem> cartItems;

  const Cart({this.cartItems = const []});

  double get _subtotal => cartItems.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.productPrice * element.quantity),
      );

  double get deliveryFee => _subtotal >= 30 ? 0 : 10;

  String get subtotalString => _subtotal.toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee.toStringAsFixed(2);

  String get freeDeliveryString => deliveryFee == 0
      ? 'You have Free Delivery'
      : 'Add \$${(30 - _subtotal).toStringAsFixed(2)} for Free Delivery';

  String get totalString => (_subtotal + deliveryFee).toStringAsFixed(2);

  @override
  List<Object?> get props => [cartItems];
}
