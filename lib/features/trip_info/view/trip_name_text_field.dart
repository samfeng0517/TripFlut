import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

import '../provider/trip_info_controller.dart';

class TripNameTextField extends HookConsumerWidget {
  const TripNameTextField({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(
        tripInfoControllerProvider.select((value) => value.value?.title));
    final textEditingController = useTextEditingController(text: title);

    return Material(
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: context.loc.trip_name,
        ),
        controller: textEditingController,
        onChanged: (value) =>
            ref.read(tripInfoControllerProvider.notifier).setTripTitle(value),
      ),
    );
  }
}
