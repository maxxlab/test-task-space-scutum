import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test/core/constants/category_enum.dart';
import 'package:space_scutum_test/features/task_list/presentation/providers/bloc/task_list_bloc.dart';

class AddTaskModal extends StatefulWidget {
  const AddTaskModal({super.key});

  @override
  State<AddTaskModal> createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final title = titleController.text;
      final description = descriptionController.text;

      titleController.clear();
      descriptionController.clear();

      Navigator.pop(context);
      BlocProvider.of<TaskListBloc>(context).add(
        AddTask(
            title: title,
            description: description,
            categoryEnum: CategoryEnum.common),
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
    return FloatingActionButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
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
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      controller: descriptionController,
                      validator: (value) =>
                          value!.isEmpty ? 'Description is required' : null,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.onPrimaryContainer),
                      foregroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.onPrimary),
                    ),
                    onPressed: () => _submitForm(),
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      child: const Icon(Icons.add),
    );
  }
}
