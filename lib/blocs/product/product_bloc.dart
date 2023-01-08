import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../../repositories/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<ProductLoad>(_onLoad);
    on<ProductUpdate>(_onProductUpdate);
  }

  void _onLoad(ProductLoad event, Emitter<ProductState> emit) {
    _productSubscription?.cancel();
    _productSubscription = _productRepository.getAllProducts().listen(
          (products) => add(ProductUpdate(products)),
        );
  }

  void _onProductUpdate(ProductUpdate event, Emitter<ProductState> emit) {
    emit(ProductLoaded(products: event.products));
  }
}
