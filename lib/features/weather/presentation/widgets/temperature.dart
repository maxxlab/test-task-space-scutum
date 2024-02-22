import 'package:flutter/material.dart';
import 'package:space_scutum_test/core/constants/font_sizes.dart';

class Temperature extends StatelessWidget {
  final double temp;
  const Temperature({required this.temp, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${temp.round().toString()}°C',
      style: TextStyle(
        fontSize: largeFontSize,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
