import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<WishlistLoad>(_mapWishlistLoadToState);
    on<WishlistAdd>(_mapWishlistAddToState);
    on<WishlistRemove>(_mapWishlistRemoveToState);
  }

  isInWishlist(Product product) {
    if (state is WishlistLoaded) {
      return (state as WishlistLoaded).wishlist.products.contains(product);
    }
    return false;
  }

  Future<void> _mapWishlistLoadToState(
    WishlistLoad event,
    Emitter<WishlistState> emit,
  ) async {
    emit(WishlistLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const WishlistLoaded());
    } catch (_) {
      emit(WishlistError());
    }
  }

  Future<void> _mapWishlistAddToState(
    WishlistAdd event,
    Emitter<WishlistState> emit,
  ) async {
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from((state as WishlistLoaded).wishlist.products)
                ..add(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  Future<void> _mapWishlistRemoveToState(
    WishlistRemove event,
    Emitter<WishlistState> emit,
  ) async {
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from((state as WishlistLoaded).wishlist.products)
                ..remove(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }
}
