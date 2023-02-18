import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tripflut/env/env.dart';

import '../model/pexels_photo.dart';

final pexelsImagesRepoProvider =
    Provider<PexelsImagesRepository>((ref) => PexelsImagesRepository());

class PexelsImagesRepository {
  final _dio = Dio(BaseOptions(
    headers: {'Authorization': Env.pexelsApiKey},
  ));

  Future<List<PexelsPhoto>> fetchImageSearchList({
    required String keyWord,
    required int pageKey,
    required String locale,
  }) async {
    var response = await _dio.get(
      'https://api.pexels.com/v1/search',
      queryParameters: {
        'query': keyWord,
        'page': pageKey,
        'locale': locale,
      },
    );

    return List.from(
        response.data['photos'].map((item) => PexelsPhoto.fromJson(item)));
  }

  Future<List<PexelsPhoto>> fetchFeaturedImageList(int pageKey) async {
    var response = await _dio.get(
      'https://api.pexels.com/v1/curated',
      queryParameters: {
        'page': pageKey,
      },
    );

    return List.from(
        response.data['photos'].map((item) => PexelsPhoto.fromJson(item)));
  }
}
