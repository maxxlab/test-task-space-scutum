import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test/core/constants/font_sizes.dart';
import 'package:space_scutum_test/features/task_list/business/entities/task_entity.dart';
import 'package:space_scutum_test/features/task_list/presentation/providers/task_list_bloc/task_list_bloc.dart';

class TaskItem extends StatelessWidget {
  final TaskEntity task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title,style: const TextStyle(fontSize: smallFontSize),),
      subtitle: Text(task.description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            task.categoryEnum.category,
            style: const TextStyle(fontSize: smallestFontSize),
          ),
          Checkbox(
            value: task.completed,
            onChanged: (value) => context.read<TaskListBloc>().add(
                  ToggleTaskCompletion(id: task.id),
                ),
          ),
          IconButton(
            onPressed: () {
              context.read<TaskListBloc>().add(RemoveTask(id: task.id));
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
