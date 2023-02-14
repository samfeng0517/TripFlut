import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

import '../provider/segmented_index_provider.dart';
import 'color_picker_view.dart';
import 'pexels_image_view.dart';

Future<dynamic> showPickImageColorDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => LayoutBuilder(
      builder: (context, constraints) {
        var windowType = getWindowType(context);
        switch (windowType) {
          case AdaptiveWindowType.large:
          case AdaptiveWindowType.xlarge:
          case AdaptiveWindowType.medium:
            return const Dialog(
              insetPadding: EdgeInsets.all(48),
              clipBehavior: Clip.antiAlias,
              child: PickImageColorDialog(),
            );

          case AdaptiveWindowType.small:
          case AdaptiveWindowType.xsmall:
          default:
            return const Dialog.fullscreen(
              child: PickImageColorDialog(),
            );
        }
      },
    ),
  );
}

class PickImageColorDialog extends ConsumerWidget {
  const PickImageColorDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(segmentedIndexProvider);

    return Container(
      color: Theme.of(context).colorScheme.surface,
      constraints: const BoxConstraints(maxHeight: 560, maxWidth: 560),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: SegmentedButton<int>(
                segments: [
                  ButtonSegment<int>(
                    value: 0,
                    label: Text(context.loc.image),
                    icon: const Icon(Icons.image),
                  ),
                  ButtonSegment<int>(
                    value: 1,
                    label: Text(context.loc.color),
                    icon: const Icon(Icons.color_lens),
                  ),
                ],
                selected: {index},
                onSelectionChanged: (p0) => ref
                    .read(segmentedIndexProvider.notifier)
                    .updateIndex(p0.first),
              ),
            ),
            Flexible(
              child: IndexedStack(
                sizing: StackFit.expand,
                index: index,
                children: [
                  const PexelsImageView(),
                  ColorPickerView(Theme.of(context).colorScheme.primary),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.close),
                label: Text(context.loc.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
