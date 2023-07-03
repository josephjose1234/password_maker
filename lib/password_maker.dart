import 'package:flutter/material.dart';
// library password_maker;

// /// A Calculator.
// class Calculator {
//   /// Returns [value] plus 1.
//   int addOne(int value) => value + 1;
// }


class ColoredContainer extends StatelessWidget {
  final Color color;

  const ColoredContainer({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
