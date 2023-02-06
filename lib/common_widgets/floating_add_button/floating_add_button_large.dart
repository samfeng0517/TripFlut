import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      onPressed: () {},
      tooltip: AppLocalizations.of(context)!.add,
      elevation: elevation,
      child: const Icon(Icons.add),
    );
  }
}
