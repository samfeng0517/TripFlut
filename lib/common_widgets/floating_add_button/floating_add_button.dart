import 'package:flutter/material.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

class FloatingAddButton extends StatelessWidget {
  final void Function()? onPressed;

  const FloatingAddButton({
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: context.loc.add,
      child: const Icon(Icons.add),
    );
  }
}
