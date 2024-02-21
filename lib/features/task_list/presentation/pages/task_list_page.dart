import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test/features/task_list/business/entities/task_entity.dart';
import 'package:space_scutum_test/features/task_list/presentation/providers/task_list_bloc/task_list_bloc.dart';
import 'package:space_scutum_test/features/task_list/presentation/widgets/add_task_modal.dart';
import 'package:space_scutum_test/features/task_list/presentation/widgets/filter_button.dart';
import 'package:space_scutum_test/features/task_list/presentation/widgets/task_list.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListBloc, TaskListState>(
      builder: (context, state) {
        if (state is TaskListLoaded || state is FilteredTaskList) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Task List'),
              centerTitle: true,
              actions: const [FilterButton()],
            ),
            body: const TaskList(),
            floatingActionButton: const AddTaskModal(),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
