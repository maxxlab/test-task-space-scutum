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

// class CategoryState {
//   final CategoryEnum selectedCategory;

//   const CategoryState({required this.selectedCategory});

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is CategoryState && selectedCategory == other.selectedCategory;

//   @override
//   int get hashCode => selectedCategory.hashCode;
// }



