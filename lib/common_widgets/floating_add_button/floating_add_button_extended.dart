import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      label: Text(AppLocalizations.of(context)!.add),
    );
  }
}
