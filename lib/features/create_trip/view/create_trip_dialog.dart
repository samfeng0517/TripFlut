import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tripflut/features/create_trip/provider/create_trip_controller.dart';
import 'package:tripflut/features/create_trip/view/create_trip_form.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

class CreateTripDialog extends ConsumerWidget {
  final void Function()? closeOnPressed;
  final void Function()? actionOnPressed;

  const CreateTripDialog({
    required this.closeOnPressed,
    required this.actionOnPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(createTripControllerProvider);

    var child = Container(
      constraints: const BoxConstraints(maxHeight: 560, maxWidth: 560),
      child: SafeArea(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              leading: IconButton(
                onPressed: closeOnPressed,
                icon: const Icon(Icons.close),
                tooltip: context.loc.close,
              ),
              title: Text(
                context.loc.create_new_trip,
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 1,
              ),
              centerTitle: false,
              actions: [
                TextButton(
                  onPressed: controller.value?.isFinished ?? false
                      ? actionOnPressed
                      : null,
                  child: Text(context.loc.create),
                ),
                const SizedBox(
                  width: 24,
                ),
              ],
            ),
            const Expanded(
              child: CreateTripForm(),
            ),
          ],
        ),
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        var windowType = getWindowType(context);
        switch (windowType) {
          case AdaptiveWindowType.large:
          case AdaptiveWindowType.xlarge:
          case AdaptiveWindowType.medium:
            return Dialog(
              insetPadding: const EdgeInsets.all(48),
              clipBehavior: Clip.antiAlias,
              child: child,
            );

          case AdaptiveWindowType.small:
          case AdaptiveWindowType.xsmall:
          default:
            return Dialog.fullscreen(
              child: child,
            );
        }
      },
    );
  }
}
