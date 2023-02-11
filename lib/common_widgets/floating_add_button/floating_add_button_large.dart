import 'package:flutter/material.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

class FloatingAddButtonLarge extends StatelessWidget {
  final void Function()? onPressed;
  final double? elevation;

  const FloatingAddButtonLarge({
    this.onPressed,
    this.elevation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: onPressed,
      tooltip: context.loc.add,
      elevation: elevation,
      child: const Icon(Icons.add),
    );
  }
}
