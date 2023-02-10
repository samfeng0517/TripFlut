import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

import '../../../common_widgets/floating_add_button/floating_add_button.dart';
import '../../../common_widgets/floating_add_button/floating_add_button_extended.dart';
import '../../../common_widgets/floating_add_button/floating_add_button_large.dart';
import '../../create_trip/view/create_trip_view.dart';
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
                if (windowType != AdaptiveWindowType.xsmall && windowType != AdaptiveWindowType.small)
                  const Padding(
                    padding: EdgeInsets.only(top: 16, left: 16, right: 8),
                    child: FloatingAddButtonLarge(
                      elevation: 1,
                    ),
                  ),
                Expanded(
                  child: ResponsiveGridList(
                    minItemWidth: 300,
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
              return const FloatingAddButtonExtended();

            case AdaptiveWindowType.xsmall:
            default:
              return OpenContainer(
                closedBuilder: (_, openContainer) => const FloatingAddButton(),
                closedElevation: 6,
                closedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                closedColor: Theme.of(context).colorScheme.primaryContainer,
                openBuilder: (context, closeContainer) => Dialog.fullscreen(
                  child: CreateTripView(
                    closeOnPressed: closeContainer,
                    saveOnPressed: () {},
                  ),
                ),
                openColor: Theme.of(context).dialogBackgroundColor,
                transitionType: ContainerTransitionType.fadeThrough,
              );
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
        return null;

      case AdaptiveWindowType.small:
      case AdaptiveWindowType.xsmall:
      default:
        return FloatingActionButtonLocation.endFloat;
    }
  }
}
