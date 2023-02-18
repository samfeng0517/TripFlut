import 'package:flutter/material.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

import 'cover_field.dart';
import 'set_trip_range_button.dart';
import 'trip_name_text_field.dart';

class TripInfoForm extends StatelessWidget {
  const TripInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(context.loc.cover),
            ),
            const SizedBox(
              height: 8,
            ),
            const CoverField(),
            const SizedBox(
              height: 24,
            ),
            const TripNameTextField(),
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
            const SizedBox(
              width: double.infinity,
              child: SetTripRangeButton(),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
