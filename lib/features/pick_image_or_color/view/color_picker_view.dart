import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

class ColorPickerView extends StatefulWidget {
  final Color pickerColor;
  const ColorPickerView(this.pickerColor, {super.key});

  @override
  State<ColorPickerView> createState() => _ColorPickerViewState();
}

class _ColorPickerViewState extends State<ColorPickerView> {
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
          // portraitOnly: true,
          enableLabel: true,
        ),
      ),
      const SizedBox.square(
        dimension: 16,
      ),
      FilledButton(
        child: Text(context.loc.apply),
        onPressed: () {},
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
