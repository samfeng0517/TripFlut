import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tripflut/common_widgets/error_indicator.dart';
import 'package:tripflut/common_widgets/small_error_indicator.dart';
import 'package:tripflut/utils/app_localizations_context.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../model/pexels_photo.dart';
import '../provider/pexels_images_repository.dart';

class PexelsImageList extends ConsumerStatefulWidget {
  const PexelsImageList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PexelsImageListState();
}

class _PexelsImageListState extends ConsumerState<PexelsImageList> {
  static const _pageSize = 15;
  final PagingController<int, PexelsPhoto> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController
        .addPageRequestListener((pageKey) => _fetchPage('travel', pageKey));
  }

  Future<void> _fetchPage(String keyWord, int pageKey) async {
    try {
      final newItems = await ref
          .read(pexelsImagesRepoProvider)
          .fetchImageSearchList('travel', pageKey);

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = ++pageKey;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      debugPrint('pexels_image_list error: $error');
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Material(
            child: TextField(
              decoration: InputDecoration(
                labelText: context.loc.search,
                filled: true,
              ),
            ),
          ),
        ),
        Expanded(
          child: PagedGridView(
            pagingController: _pagingController,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            builderDelegate: PagedChildBuilderDelegate<PexelsPhoto>(
              itemBuilder: (context, item, index) => Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.surfaceVariant,
                clipBehavior: Clip.antiAlias,
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
                          imageUrl: item.src!.medium!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        item.photographer ?? '',
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
                title: context.loc.error_title,
                message: context.loc.error_message,
                onTryAgain: () => _pagingController.refresh(),
              ),
              newPageErrorIndicatorBuilder: (context) => SmallErrorIndicator(
                onTap: () => _pagingController.retryLastFailedRequest(),
              ),
              noItemsFoundIndicatorBuilder: (context) => ErrorIndicator(
                title: context.loc.no_items_found,
                message: context.loc.list_is_empty,
              ),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.33,
            ),
          ),
        ),
        TextButton(
          onPressed: () async =>
              await launchUrlString('https://www.pexels.com'),
          child: Text(context.loc.photos_provided_by_Pexels),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
