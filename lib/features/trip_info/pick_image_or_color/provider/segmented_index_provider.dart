import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'segmented_index_provider.g.dart';

@riverpod
class SegmentedIndex extends _$SegmentedIndex {
  @override
  int build() {
    return 0;
  }

  void updateIndex(int index) {
    state = index;
  }
}
