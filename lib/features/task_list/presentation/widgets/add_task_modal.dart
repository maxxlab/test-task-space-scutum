import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test/core/constants/category_enum.dart';
import 'package:space_scutum_test/features/task_list/presentation/providers/category_bloc/category_bloc.dart';
import 'package:space_scutum_test/features/task_list/presentation/providers/task_list_bloc/task_list_bloc.dart';
import 'package:space_scutum_test/features/task_list/presentation/widgets/category_dropdown.dart';

class AddTaskModal extends StatefulWidget {
  const AddTaskModal({super.key});

  @override
  State<AddTaskModal> createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void _submitForm({required CategoryState categoryState}) {
    if (_formKey.currentState!.validate()) {
      final title = titleController.text;
      final description = descriptionController.text;
      CategoryEnum categoryEnum = CategoryEnum.common;

      titleController.clear();
      descriptionController.clear();

      if (categoryState is CategoryChosen) {
        categoryEnum = categoryState.categoryEnum;
      }

      Navigator.pop(context);
      BlocProvider.of<TaskListBloc>(context).add(
        AddTask(
            title: title, description: description, categoryEnum: categoryEnum),
      );
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        // final stateCategory = context.watch<CategoryBloc>().state;

        return FloatingActionButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: TextFormField(
                            autofocus: true,
                            controller: titleController,
                            validator: (value) =>
                                value!.isEmpty ? 'Title is required' : null,
                            decoration:
                                const InputDecoration(labelText: 'Title'),
                          ),
                        ),
                        ListTile(
                          title: TextFormField(
                            controller: descriptionController,
                            validator: (value) => value!.isEmpty
                                ? 'Description is required'
                                : null,
                            decoration:
                                const InputDecoration(labelText: 'Description'),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CategoryDropdown(),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer),
                                foregroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              onPressed: () {
                                final categoryState =
                                    BlocProvider.of<CategoryBloc>(context)
                                        .state;

                                BlocProvider.of<CategoryBloc>(context).add(
                                  const SelectCategory(
                                      categoryEnum: CategoryEnum.common),
                                );

                                _submitForm(categoryState: categoryState);
                              },
                              child: const Text(
                                'Add',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          child: Icon(Icons.add, color:  Theme.of(context).colorScheme.onPrimary,),
        );
      },
    );
  }
}
