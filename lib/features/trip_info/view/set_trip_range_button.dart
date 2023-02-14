import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

import '../provider/trip_info_controller.dart';

class SetTripRangeButton extends ConsumerWidget {
  const SetTripRangeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(tripInfoControllerProvider);
    final bool hasTime = controller.value?.startTime != null;

    return FilledButton.tonal(
      onPressed: () => _showDateRangePicker(context, ref),
      child: hasTime
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat.yMd(Localizations.localeOf(context).toString())
                    .format(controller.value!.startTime!)),
                const Icon(Icons.arrow_forward),
                Text(DateFormat.yMd(Localizations.localeOf(context).toString())
                    .format(controller.value!.endTime!)),
              ],
            )
          : Text(context.loc.set_dates),
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
    final controller = ref.watch(tripInfoControllerProvider);
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
          .read(tripInfoControllerProvider.notifier)
          .setTripRange(result.start, result.end);
    }
  }
}
