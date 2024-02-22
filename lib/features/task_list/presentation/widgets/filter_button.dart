import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test/core/constants/category_enum.dart';
import 'package:space_scutum_test/features/task_list/presentation/providers/task_list_bloc/task_list_bloc.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListBloc, TaskListState>(
      builder: (context, state) {
        return PopupMenuButton(
          icon: const Icon(Icons.filter_list),
          itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                child: const Text('Completed tasks'),
                onTap: () {
                  BlocProvider.of<TaskListBloc>(context).add(
                    const FilterTaskList(
                      completed: true,
                    ),
                  );
                },
              ),
              PopupMenuItem<int>(
                child: const Text('Uncompleted tasks'),
                onTap: () {
                  BlocProvider.of<TaskListBloc>(context).add(
                    const FilterTaskList(
                      completed: false,
                    ),
                  );
                },
              ),
              PopupMenuItem<int>(
                child: PopupMenuButton(
                  child: const Text('By category'),
                  itemBuilder: (context) {
                    return [
                      ...categoryList.map(
                        (category) => PopupMenuItem<int>(
                          child: Text(category),
                          onTap: () {
                            BlocProvider.of<TaskListBloc>(context).add(
                              FilterTaskList(
                                categoryEnum: category.toCategoryEnum(),
                              ),
                            );
                          },
                        ),
                      )
                    ];
                  },
                ),
              ),
              if (state is FilteredTaskList)
                PopupMenuItem<int>(
                  child: const Text('Clear filters'),
                  onTap: () {
                    BlocProvider.of<TaskListBloc>(context).add(
                      LoadTasks(),
                    );
                  },
                ),
            ];
          },
        );
      },
    );
  }
}
