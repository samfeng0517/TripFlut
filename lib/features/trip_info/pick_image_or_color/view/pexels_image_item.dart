import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/trip_info_controller.dart';
import '../model/pexels_photo.dart';

class PexelsImageItem extends ConsumerWidget {
  final PexelsPhoto pexelsPhoto;
  final VoidCallback? onTap;
  const PexelsImageItem({required this.pexelsPhoto, this.onTap, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          ref
              .read(tripInfoControllerProvider.notifier)
              .setPexelsPhoto(pexelsPhoto);
          context.pop();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: pexelsPhoto.src!.medium!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                pexelsPhoto.photographer ?? '',
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
