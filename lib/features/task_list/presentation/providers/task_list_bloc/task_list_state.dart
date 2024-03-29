part of 'task_list_bloc.dart';

sealed class TaskListState extends Equatable {
  const TaskListState();

  @override
  List<Object> get props => [];
}

final class TaskListLoading extends TaskListState {}

final class TaskListLoaded extends TaskListState {
  final List<TaskEntity> taskList;

  const TaskListLoaded({required this.taskList});

  @override
  List<Object> get props => [taskList];
}

final class FilteredTaskList extends TaskListState {
  
  final List<TaskEntity> filteredTaskList;
  const FilteredTaskList(
      {required this.filteredTaskList});

  @override
  List<Object> get props => [filteredTaskList];
}

class TaskListError extends TaskListState {
  final String error;

  const TaskListError({required this.error});

  @override
  List<Object> get props => [error];
}
