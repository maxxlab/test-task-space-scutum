part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
  
  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {
}

final class CategoryChosen extends CategoryState {
  final CategoryEnum categoryEnum;

  const CategoryChosen({required this.categoryEnum});

   @override
  List<Object> get props => [categoryEnum];
}

