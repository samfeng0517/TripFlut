import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

import '../../pick_image_or_color/view/pick_image_color_dialog.dart';
import '../provider/create_trip_controller.dart';

class CreateTripForm extends HookConsumerWidget {
  const CreateTripForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(createTripControllerProvider);
    final textEditingController =
        useTextEditingController(text: controller.value?.title);

    bool hasTime = controller.value?.startTime != null;
    bool hasColor = controller.value?.color != null;
    bool hasImg = controller.value?.imgPath != null;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: context.loc.trip_name,
              ),
              controller: textEditingController,
              onChanged: (value) => ref
                  .read(createTripControllerProvider.notifier)
                  .setTripTitle(value),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.loc.start),
              Text(context.loc.end),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton.tonal(
              onPressed: () => _showDateRangePicker(context, ref),
              child: hasTime
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(DateFormat.yMd(
                                Localizations.localeOf(context).toString())
                            .format(controller.value!.startTime!)),
                        const Icon(Icons.arrow_forward),
                        Text(DateFormat.yMd(
                                Localizations.localeOf(context).toString())
                            .format(controller.value!.endTime!)),
                      ],
                    )
                  : Text(context.loc.set_dates),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(context.loc.cover),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton.tonalIcon(
              onPressed: () async => await showPickImageColorDialog(context),
              label: Text(context.loc.choose_picture_or_color),
              icon: const Icon(Icons.image),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDateRangePicker(BuildContext context, WidgetRef ref) async {
    DatePickerEntryMode initEntryMode;
    var windowType = getWindowType(context);
    switch (windowType) {
      case AdaptiveWindowType.large:
      case AdaptiveWindowType.xlarge:
      case AdaptiveWindowType.medium:
        initEntryMode = DatePickerEntryMode.input;
        break;

      case AdaptiveWindowType.small:
      case AdaptiveWindowType.xsmall:
      default:
        initEntryMode = DatePickerEntryMode.calendar;
    }

    DateTimeRange? initialDateRange;
    final controller = ref.watch(createTripControllerProvider);
    if (controller.value?.startTime != null) {
      initialDateRange = DateTimeRange(
        start: controller.value!.startTime!,
        end: controller.value!.endTime!,
      );
    }

    var result = await showDateRangePicker(
      context: context,
      initialEntryMode: initEntryMode,
      initialDateRange: initialDateRange,
      firstDate: DateTime(2000),
      lastDate: DateTime(2099),
      builder: (context, child) => SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            useMaterial3: false,
          ),
          child: child!,
        ),
      ),
    );

    if (result != null) {
      ref
          .read(createTripControllerProvider.notifier)
          .setTripRange(result.start, result.end);
    }
  }
}
