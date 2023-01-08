import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/product/product_bloc.dart';
import 'package:flutter_ecommerce_app/config/app_router.dart';
import 'package:flutter_ecommerce_app/config/theme.dart';
import 'package:flutter_ecommerce_app/firebase_options.dart';
import 'package:flutter_ecommerce_app/repositories/category/category_repository.dart';
import 'package:flutter_ecommerce_app/repositories/product/product_repository.dart';

import 'blocs/cart/cart_bloc.dart';
import 'blocs/category/category_bloc.dart';
import 'blocs/simple_bloc_observer.dart';
import 'blocs/wishlist/wishlist_bloc.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WishlistBloc()..add(WishlistLoad())),
        BlocProvider(create: (context) => CartBloc()..add(CartLoad())),
        BlocProvider(
          create: (context) =>
              CategoryBloc(categoryRepository: CategoryRepository())
                ..add(CategoryLoad()),
        ),
        BlocProvider(
          create: (context) =>
              ProductBloc(productRepository: ProductRepository())
                ..add(ProductLoad()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: themeData(),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
