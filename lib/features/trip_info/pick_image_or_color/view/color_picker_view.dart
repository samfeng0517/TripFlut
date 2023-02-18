import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

import '../../provider/trip_info_controller.dart';

class ColorPickerView extends ConsumerStatefulWidget {
  final Color pickerColor;
  const ColorPickerView(this.pickerColor, {super.key});

  @override
  ConsumerState<ColorPickerView> createState() => _ColorPickerViewState();
}

class _ColorPickerViewState extends ConsumerState<ColorPickerView> {
  late Color pickerColor;

  @override
  void initState() {
    pickerColor = widget.pickerColor;
    super.initState();
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    final children = [
      Expanded(
        child: MaterialPicker(
          pickerColor: pickerColor,
          onColorChanged: changeColor,
          enableLabel: true,
        ),
      ),
      const SizedBox.square(
        dimension: 16,
      ),
      FilledButton(
        child: Text(context.loc.apply),
        onPressed: () {
          ref
              .read(tripInfoControllerProvider.notifier)
              .setTripColor(pickerColor);
          context.pop();
        },
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: OrientationBuilder(
        builder: (_, orientation) {
          switch (orientation) {
            case Orientation.portrait:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              );
            case Orientation.landscape:
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              );
          }
        },
      ),
    );
  }
}
