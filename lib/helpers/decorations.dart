import 'package:flutter/material.dart';

class NoneInputDecoration extends InputDecoration {
  const NoneInputDecoration({super.hintText, super.hintStyle})
      : super(
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        );
}

class LerpTween extends Tween<double> {
  LerpTween() : super(begin: 0.0, end: 1.0);
}
