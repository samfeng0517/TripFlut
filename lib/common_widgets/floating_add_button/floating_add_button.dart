import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      tooltip: AppLocalizations.of(context)!.add,
      child: const Icon(Icons.add),
    );
  }
}
