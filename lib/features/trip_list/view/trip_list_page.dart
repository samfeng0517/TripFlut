import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tripflut/common_widgets/floating_add_button/floating_add_button_extended.dart';
import 'package:tripflut/common_widgets/floating_add_button/floating_add_button_large.dart';

import '../../../common_widgets/floating_add_button/floating_add_button.dart';

class TripListPage extends StatelessWidget {
  const TripListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.trip_list_title,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
            ),
            tooltip: AppLocalizations.of(context)!.settings,
          ),
        ],
      ),
      floatingActionButton: LayoutBuilder(
        builder: (BuildContext context, _) {
          var windowType = getWindowType(context);
          switch (windowType) {
            case AdaptiveWindowType.large:
            case AdaptiveWindowType.xlarge:
            case AdaptiveWindowType.medium:
              return const Padding(
                padding: EdgeInsets.only(top: kToolbarHeight),
                child: FloatingAddButtonLarge(
                  elevation: 1,
                ),
              );

            case AdaptiveWindowType.small:
              return const FloatingAddButtonExtended();

            case AdaptiveWindowType.xsmall:
            default:
              return const FloatingAddButton();
          }
        },
      ),
      floatingActionButtonLocation: _getFloatingButtonLocation(context),
    );
  }

  FloatingActionButtonLocation? _getFloatingButtonLocation(BuildContext context) {
    var windowType = getWindowType(context);
    switch (windowType) {
      case AdaptiveWindowType.large:
      case AdaptiveWindowType.xlarge:
      case AdaptiveWindowType.medium:
        return FloatingActionButtonLocation.startTop;

      case AdaptiveWindowType.small:
      case AdaptiveWindowType.xsmall:
      default:
        return FloatingActionButtonLocation.endFloat;
    }
  }
}
