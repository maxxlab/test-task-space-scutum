import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test/core/constants/category_enum.dart';
import 'package:space_scutum_test/core/constants/font_sizes.dart';
import 'package:space_scutum_test/core/constants/spacings.dart';
import 'package:space_scutum_test/features/task_list/presentation/providers/category_bloc/category_bloc.dart';

class CategoryDropdown extends StatefulWidget {
  const CategoryDropdown({super.key});

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  String dropdownValue = categoryList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: elevation.toInt(),
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      underline: Container(
        height: 2,
        color: Theme.of(context).colorScheme.primary,
      ),
      onChanged: (String? value) async {
        setState(() {
          dropdownValue = value!;
        });
        context.read<CategoryBloc>().add(
              SelectCategory(
                categoryEnum: value!.toCategoryEnum(),
              ),
            );
        await Future.delayed(Duration.zero);
      },
      items: categoryList.map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontSize: smallFontSize),
            ),
          );
        },
      ).toList(),
    );
  }
}
