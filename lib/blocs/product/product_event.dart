part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductLoad extends ProductEvent {}

class ProductUpdate extends ProductEvent {
  final List<Product> products;

  const ProductUpdate(this.products);

  @override
  List<Object> get props => [products];
}
