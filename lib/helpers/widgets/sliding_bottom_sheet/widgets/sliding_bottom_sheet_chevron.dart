import 'package:flutter/material.dart';
import 'package:helpers/helpers.dart';

class SlidingBottomSheetChevron extends StatelessWidget {
  const SlidingBottomSheetChevron({super.key, this.color = Colors.white});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 6,
      margin: const Margin.vertical(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: EdgeRadius.all(20),
      ),
    );
  }
}
