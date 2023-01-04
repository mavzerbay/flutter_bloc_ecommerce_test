// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Test Ecommerce',
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: Category.categories
                .map(
                  (category) => HeroCarouselCard(category: category),
                )
                .toList(),
          ),
          const SectionTitle(
            title: 'RECOMMENDED',
          ),
          ProductCarousel(
            products: Product.products
                .where((element) => element.isRecommended)
                .toList(),
          ),
          const SectionTitle(
            title: 'MOST POPULAR',
          ),
          ProductCarousel(
            products:
                Product.products.where((element) => element.isPopular).toList(),
          )
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}