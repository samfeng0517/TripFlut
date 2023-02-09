import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../model/trip.dart';

class TripCard extends ConsumerWidget {
  final Trip trip;

  const TripCard(this.trip, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: HexColor(trip.color),
                ),
                width: double.infinity,
                child: trip.imageUrl != null
                    ? CachedNetworkImage(
                        imageUrl: trip.imageUrl!,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: HexColor(trip.color),
                          highlightColor: Theme.of(context).highlightColor,
                          child: const SizedBox.expand(),
                        ),
                      )
                    : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                trip.title,
                style: Theme.of(context).textTheme.displaySmall,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Row(
                children: [
                  Text(
                    DateFormat.Md().format(trip.startTime),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: Theme.of(context).textTheme.titleLarge?.fontSize,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    DateFormat.Md().format(trip.endTime),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
