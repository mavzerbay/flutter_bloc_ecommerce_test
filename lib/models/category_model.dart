import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snapshot) {
    return Category(
      name: snapshot['name'],
      imageUrl: snapshot['imageUrl'],
    );
  }

  static List<Category> categories = [
    const Category(
      name: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1625740822008-e45abf4e01d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    ),
    const Category(
      name: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=816&q=80',
    ),
    const Category(
      name: 'Water',
      imageUrl:
          'https://images.unsplash.com/photo-1553564552-02656d6a2390?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=830&q=80',
    )
  ];
}
