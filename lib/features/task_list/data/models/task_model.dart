// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:space_scutum_test/core/constants/category_enum.dart';

import '../../business/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  final String id;
  final String title;
  final String description;
  final bool completed;
  final CategoryEnum categoryEnum;

  const TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
    required this.categoryEnum,
  }) : super(
            id: '',
            title: '',
            description: '',
            completed: false,
            categoryEnum: CategoryEnum.common);

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? completed,
    CategoryEnum? categoryEnum,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      categoryEnum: categoryEnum ?? this.categoryEnum,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'completed': completed,
      'categoryEnum': categoryEnum.category,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      completed: map['completed'] as bool,
      categoryEnum: (map['categoryEnum'] as String).toCategoryEnum(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, description: $description, completed: $completed, categoryEnum: $categoryEnum)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.completed == completed &&
        other.categoryEnum == categoryEnum;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        completed.hashCode ^
        categoryEnum.hashCode;
  }
}
