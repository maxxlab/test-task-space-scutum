import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:space_scutum_test/core/constants/category_enum.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<SelectCategory>(
      (event, emit) {
        emit(CategoryChosen(categoryEnum: event.categoryEnum));
      },
    );
  }
}
