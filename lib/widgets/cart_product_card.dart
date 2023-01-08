import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/cart/cart_bloc.dart';

import '../models/models.dart';

class CartProductCard extends StatelessWidget {
  final CartItem cartItem;
  const CartProductCard({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            cartItem.productImageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.productName,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  '\$${cartItem.productPrice}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return const CircularProgressIndicator();
              } else if (state is CartLoaded) {
                return Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(
                              CartRemove(cartItem: cartItem),
                            );
                      },
                      icon: const Icon(Icons.remove_circle),
                    ),
                    Text(
                      state.cart.cartItems
                          .firstWhere((element) => element == cartItem)
                          .quantity
                          .toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(
                              CartAdd(cartItem: cartItem),
                            );
                      },
                      icon: const Icon(Icons.add_circle),
                    ),
                  ],
                );
              } else {
                return const Text('Error');
              }
            },
          )
        ],
      ),
    );
  }
}
