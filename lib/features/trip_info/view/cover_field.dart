import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

import '../pick_image_or_color/view/pick_image_color_dialog.dart';
import '../provider/trip_info_controller.dart';

class CoverField extends ConsumerWidget {
  const CoverField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(tripInfoControllerProvider);
    final bool hasPexelsPhoto = controller.value?.pexelsPhotoSrc != null;
    final bool hasColor = controller.value?.color != null;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Card(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: InkWell(
            onTap: () async => await showPickImageColorDialog(context),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                if (!hasPexelsPhoto && hasColor)
                  ColoredBox(
                    color: Color(controller.value!.color!),
                  ),
                if (hasPexelsPhoto)
                  CachedNetworkImage(
                    imageUrl: controller.value!.pexelsPhotoSrc!.landscape!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => SizedBox.expand(
                      child: Shimmer.fromColors(
                        baseColor: Color(controller.value!.color!),
                        highlightColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        child: const SizedBox.expand(),
                      ),
                    ),
                  ),
                if (!hasPexelsPhoto && !hasColor)
                  Text(context.loc.choose_picture_or_color),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
