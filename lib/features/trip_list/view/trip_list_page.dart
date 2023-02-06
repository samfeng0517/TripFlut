import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tripflut/common_widgets/floating_add_button/floating_add_button.dart';
import 'package:tripflut/common_widgets/floating_add_button/floating_add_button_extended.dart';
import 'package:tripflut/common_widgets/floating_add_button/floating_add_button_large.dart';

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
      body: AdaptiveLayout(
        bottomNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: SlotLayout.from(
              key: const Key('Trip List Page FAB Small'),
              builder: (context) => SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(right: 16, bottom: 16),
                  alignment: Alignment.bottomRight,
                  child: const FloatingAddButton(),
                ),
              ),
            ),
            Breakpoints.medium: SlotLayout.from(
              key: const Key('Trip List Page FAB Medium'),
              inAnimation: (child, animation) =>
                  AdaptiveScaffold.bottomToTop(child, animation),
              outAnimation: (child, animation) =>
                  AdaptiveScaffold.topToBottom(child, animation),
              builder: (context) => SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(right: 16, bottom: 16),
                  alignment: Alignment.bottomRight,
                  child: const FloatingAddButtonExtended(),
                ),
              ),
            ),
          },
        ),
        primaryNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.largeDesktop: SlotLayout.from(
              key: const Key('Trip List Page FAB Large'),
              builder: (context) => const SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 16, left: 16),
                  child: FloatingAddButtonLarge(
                    elevation: 1,
                  ),
                ),
              ),
            ),
          },
        ),
      ),
    );
  }
}
