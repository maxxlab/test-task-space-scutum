part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class SelectCategory extends CategoryEvent {
  final CategoryEnum categoryEnum;

  const SelectCategory({required this.categoryEnum});

  @override
  List<Object> get props => [categoryEnum];
}

