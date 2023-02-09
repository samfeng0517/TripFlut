import 'package:flutter/material.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

class FloatingAddButtonExtended extends StatelessWidget {
  final void Function()? onPressed;

  const FloatingAddButtonExtended({
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      icon: const Icon(Icons.add),
      label: Text(context.loc.add),
    );
  }
}
