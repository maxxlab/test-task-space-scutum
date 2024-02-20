import 'package:flutter/material.dart';
import 'package:space_scutum_test/features/task_list/presentation/widgets/add_task_modal.dart';
import 'package:space_scutum_test/features/task_list/presentation/widgets/task_list.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TaskList(),
      floatingActionButton: AddTaskModal(),
    );
  }
}
