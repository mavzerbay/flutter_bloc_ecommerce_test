// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final String productName;
  final String productImageUrl;
  final double productPrice;
  int quantity;

  CartItem({
    required this.productName,
    required this.productImageUrl,
    required this.productPrice,
    this.quantity = 1,
  });

  @override
  List<Object?> get props => [
        productName,
        productImageUrl,
        productPrice,
        quantity,
      ];
}
