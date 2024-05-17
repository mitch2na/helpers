import 'package:flutter/material.dart';

class TopLeftAlign extends StatelessWidget {
  const TopLeftAlign({
    super.key,
    this.widthFactor,
    this.heightFactor,
    this.child,
  });

  /// If non-null, sets its width to the child's width multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? widthFactor;

  /// If non-null, sets its height to the child's height multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? heightFactor;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }
}

class TopCenterAlign extends StatelessWidget {
  const TopCenterAlign({
    super.key,
    this.widthFactor,
    this.heightFactor,
    this.child,
  });

  /// If non-null, sets its width to the child's width multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? widthFactor;

  /// If non-null, sets its height to the child's height multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? heightFactor;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }
}

class TopRightAlign extends StatelessWidget {
  const TopRightAlign({
    super.key,
    this.widthFactor,
    this.heightFactor,
    this.child,
  });

  /// If non-null, sets its width to the child's width multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? widthFactor;

  /// If non-null, sets its height to the child's height multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? heightFactor;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }
}

class CenterLeftAlign extends StatelessWidget {
  const CenterLeftAlign({
    super.key,
    this.widthFactor,
    this.heightFactor,
    this.child,
  });

  /// If non-null, sets its width to the child's width multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? widthFactor;

  /// If non-null, sets its height to the child's height multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? heightFactor;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }
}

class CenterRightAlign extends StatelessWidget {
  const CenterRightAlign({
    super.key,
    this.widthFactor,
    this.heightFactor,
    this.child,
  });

  /// If non-null, sets its width to the child's width multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? widthFactor;

  /// If non-null, sets its height to the child's height multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? heightFactor;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }
}

class BottomLeftAlign extends StatelessWidget {
  const BottomLeftAlign({
    super.key,
    this.widthFactor,
    this.heightFactor,
    this.child,
  });

  /// If non-null, sets its width to the child's width multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? widthFactor;

  /// If non-null, sets its height to the child's height multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? heightFactor;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }
}

class BottomCenterAlign extends StatelessWidget {
  const BottomCenterAlign({
    super.key,
    this.widthFactor,
    this.heightFactor,
    this.child,
  });

  /// If non-null, sets its width to the child's width multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? widthFactor;

  /// If non-null, sets its height to the child's height multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? heightFactor;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }
}

class BottomRightAlign extends StatelessWidget {
  const BottomRightAlign({
    super.key,
    this.widthFactor,
    this.heightFactor,
    this.child,
  });

  /// If non-null, sets its width to the child's width multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? widthFactor;

  /// If non-null, sets its height to the child's height multiplied by this factor.
  ///
  /// Can be both greater and less than 1.0 but must be non-negative.
  final double? heightFactor;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }
}
