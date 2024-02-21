import 'package:space_scutum_test/core/constants/category_enum.dart';
import 'package:space_scutum_test/features/task_list/business/entities/task_entity.dart';
import 'package:space_scutum_test/features/task_list/data/models/task_model.dart';

class NoParams {}

class TemplateParams {}

class TaskParams {
  final String title;
  final String description;

  TaskParams({
    required this.title,
    required this.description,
  });
}

class TasksFilterParams {
  final bool? completed;
  final CategoryEnum? categoryEnum;

  TasksFilterParams({
    this.categoryEnum,
    this.completed,
  });
}
