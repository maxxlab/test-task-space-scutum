import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test/features/task_list/presentation/providers/bloc/task_list_bloc.dart';
import 'package:space_scutum_test/features/task_list/presentation/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListBloc, TaskListState>(
      builder: (context, state) {
        if (state is TaskListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TaskListLoaded) {
          final taskList = state.taskList;
          return ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              final task = taskList[index];
              return TaskItem(
                task: task,
              );
            },
          );
        } else if (state is TaskListError) {
          return Center(
            child: Text(state.error),
          );
        }
        return Container(); // Handle unexpected states
      },
    );
  }
}
