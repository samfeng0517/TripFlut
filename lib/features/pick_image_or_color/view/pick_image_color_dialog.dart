import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

import 'pexels_image_view.dart';

Future<dynamic> showPickImageColorDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          var windowType = getWindowType(context);
          EdgeInsets padding;
          BoxConstraints? constraints;
          RoundedRectangleBorder? shape;

          switch (windowType) {
            case AdaptiveWindowType.large:
            case AdaptiveWindowType.xlarge:
            case AdaptiveWindowType.medium:
              padding =
                  const EdgeInsets.fromLTRB(48, 48 + kToolbarHeight, 48, 48);
              constraints = const BoxConstraints(
                  maxHeight: 560 - kToolbarHeight, maxWidth: 560);
              break;

            case AdaptiveWindowType.small:
            case AdaptiveWindowType.xsmall:
            default:
              padding = const EdgeInsets.only(top: kToolbarHeight);
              shape = const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(28.0),
                  topLeft: Radius.circular(28.0),
                ),
              );
              break;
          }

          return Dialog(
            insetPadding: padding,
            clipBehavior: Clip.antiAlias,
            shape: shape,
            child: PickImageColorView(
              constraints: constraints,
            ),
          );
        },
      );
    },
  );
}

class PickImageColorView extends ConsumerWidget {
  final BoxConstraints? constraints;
  const PickImageColorView({this.constraints, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: constraints,
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.close),
                tooltip: context.loc.close,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
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
                selected: const {0},
                onSelectionChanged: (p0) {},
              ),
            ),
            const Expanded(
              child: PexelsImageView(),
            ),
          ],
        ),
      ),
    );
  }
}
