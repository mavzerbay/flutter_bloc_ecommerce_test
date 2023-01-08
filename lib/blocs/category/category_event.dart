part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoryLoad extends CategoryEvent {}

class CategoryUpdate extends CategoryEvent {
  final List<Category> categories;

  const CategoryUpdate(this.categories);

  @override
  List<Object> get props => [categories];
}
