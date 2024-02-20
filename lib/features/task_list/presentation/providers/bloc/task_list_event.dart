part of 'task_list_bloc.dart';

sealed class TaskListEvent extends Equatable {
  const TaskListEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TaskListEvent {}

class AddTask extends TaskListEvent {
  final String title;
  final String description;
  final CategoryEnum categoryEnum;

  const AddTask({
    required this.title,
    required this.description,
    required this.categoryEnum,
  });

  @override
  List<Object> get props => [title, description, categoryEnum];
}

class RemoveTask extends TaskListEvent {
  final String id;

  const RemoveTask({required this.id});

  @override
  List<Object> get props => [id];
}

class ToggleTaskCompletion extends TaskListEvent {
  final String id;

  const ToggleTaskCompletion({required this.id});

  @override
  List<Object> get props => [id];
}
