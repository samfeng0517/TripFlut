import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

import '../../pick_image_or_color/view/pick_image_color_dialog.dart';

class SetCoverButton extends ConsumerWidget {
  const SetCoverButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.tonal(
      onPressed: () async => await showPickImageColorDialog(context),
      child: Text(context.loc.choose_picture_or_color),
    );
  }
}
