import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
            Flexible(
              child: AspectRatio(
                aspectRatio: 2 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: Color(trip.color),
                  ),
                  width: double.infinity,
                  child: trip.imageUrl != null
                      ? CachedNetworkImage(
                          imageUrl: trip.imageUrl!,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Color(trip.color),
                            highlightColor: Theme.of(context).highlightColor,
                            child: const SizedBox.expand(),
                          ),
                        )
                      : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                trip.title,
                style: Theme.of(context).textTheme.displaySmall,
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  Text(
                    DateFormat.Md().format(trip.startTime),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    size: 24,
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
