import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tripflut/common_widgets/error_indicator.dart';
import 'package:tripflut/common_widgets/small_error_indicator.dart';
import 'package:tripflut/utils/app_localizations_context.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:easy_debounce/easy_debounce.dart';

import '../model/pexels_photo.dart';
import '../provider/pexels_images_repository.dart';
import 'pexels_image_item.dart';

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

  String _keyWord = '';
  String _locale = 'en-US';

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      List<PexelsPhoto> newItems;
      if (_keyWord.isNotEmpty) {
        newItems =
            await ref.read(pexelsImagesRepoProvider).fetchImageSearchList(
                  keyWord: _keyWord,
                  pageKey: pageKey,
                  locale: _locale,
                );
      } else {
        newItems = await ref
            .read(pexelsImagesRepoProvider)
            .fetchFeaturedImageList(pageKey);
      }

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
              onChanged: (value) => _updateSearch(context, value),
            ),
          ),
        ),
        Expanded(
          child: PagedGridView(
            pagingController: _pagingController,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            builderDelegate: PagedChildBuilderDelegate<PexelsPhoto>(
              itemBuilder: (context, item, index) => PexelsImageItem(
                pexelsPhoto: item,
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

  void _updateSearch(BuildContext context, String value) {
    EasyDebounce.debounce(
      'pexels_image_search',
      const Duration(milliseconds: 500),
      () {
        if (value.isEmpty) {
          _keyWord = '';
        } else {
          _keyWord = value;
          Locale mylocale = Localizations.localeOf(context);
          if (mylocale == const Locale('zh', 'TW')) {
            _locale = 'zh-TW';
          } else if (mylocale == const Locale('zh')) {
            _locale = 'zh-CN';
          } else {
            _locale = 'en-US';
          }
        }
        _pagingController.refresh();
      },
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    EasyDebounce.cancel('pexels_image_search');
    super.dispose();
  }
}
