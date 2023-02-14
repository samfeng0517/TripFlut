import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

import '../../../common_widgets/floating_add_button/floating_add_button.dart';
import '../../../common_widgets/floating_add_button/floating_add_button_extended.dart';
import '../../../common_widgets/floating_add_button/floating_add_button_large.dart';

import '../../trip_info/view/trip_info_dialog.dart';
import '../model/trip.dart';
import 'trip_card.dart';

class TripListPage extends StatelessWidget {
  const TripListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> testList = List.generate(
      20,
      (index) => TripCard(
        Trip(
          id: index.toString(),
          title: 'Trip $index',
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(days: 8)),
          color: 4294951175,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.loc.trip_list_title,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
            ),
            tooltip: context.loc.settings,
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, _) {
            var windowType = getWindowType(context);
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (windowType != AdaptiveWindowType.xsmall &&
                    windowType != AdaptiveWindowType.small)
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16, right: 8),
                    child: FloatingAddButtonLarge(
                      elevation: 1,
                      onPressed: () =>
                          _openCreateTripDialog(context, Alignment.topLeft),
                    ),
                  ),
                Expanded(
                  child: ResponsiveGridList(
                    minItemWidth: 400,
                    horizontalGridSpacing: 8,
                    verticalGridSpacing: 8,
                    horizontalGridMargin: 8,
                    verticalGridMargin: 8,
                    children: testList,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: LayoutBuilder(
        builder: (BuildContext context, _) {
          var windowType = getWindowType(context);
          switch (windowType) {
            case AdaptiveWindowType.large:
            case AdaptiveWindowType.xlarge:
            case AdaptiveWindowType.medium:
              return const SizedBox.shrink();

            case AdaptiveWindowType.small:
              return FloatingAddButtonExtended(
                onPressed: () =>
                    _openCreateTripDialog(context, Alignment.bottomRight),
              );

            case AdaptiveWindowType.xsmall:
            default:
              return FloatingAddButton(
                onPressed: () =>
                    _openCreateTripDialog(context, Alignment.bottomRight),
              );
          }
        },
      ),
      floatingActionButtonLocation: _getFloatingButtonLocation(context),
    );
  }

  FloatingActionButtonLocation? _getFloatingButtonLocation(
      BuildContext context) {
    var windowType = getWindowType(context);
    switch (windowType) {
      case AdaptiveWindowType.large:
      case AdaptiveWindowType.xlarge:
      case AdaptiveWindowType.medium:
        return null;

      case AdaptiveWindowType.small:
      case AdaptiveWindowType.xsmall:
      default:
        return FloatingActionButtonLocation.endFloat;
    }
  }

  Future<void> _openCreateTripDialog(
      BuildContext context, Alignment alignment) async {
    await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionBuilder: (context, animation, secondaryAnimation, child) =>
          ScaleTransition(
        scale: animation,
        alignment: alignment,
        child: child,
      ),
      pageBuilder: (context, _, __) => TripInfoDialog(
        closeOnPressed: () => context.pop(),
        actionOnPressed: () {},
      ),
    );
  }
}
