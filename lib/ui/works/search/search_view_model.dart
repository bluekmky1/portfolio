import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/similar_check_search_helper.dart';
import '../../common/const/flower/pummock_list.dart';
import 'search_state.dart';

final AutoDisposeStateNotifierProvider<SearchViewModel, SearchState>
    searchViewModelProvider =
    StateNotifierProvider.autoDispose<SearchViewModel, SearchState>(
  (Ref<SearchState> ref) => SearchViewModel(
    state: SearchState.init(),
  ),
);

class SearchViewModel extends StateNotifier<SearchState> {
  SearchViewModel({
    required SearchState state,
  }) : super(state);

  void onInit() {
    final List<String> shuffledList = <String>[...pummockList]..shuffle();
    final int length = shuffledList.length;
    state = state.copyWith(
      allPummockListSlice1: shuffledList.sublist(0, length ~/ 3),
      allPummockListSlice2: shuffledList.sublist(length ~/ 3, length ~/ 3 * 2),
      allPummockListSlice3: shuffledList.sublist(length ~/ 3 * 2, length),
    );

    state = state.copyWith(
      searchedPummockList1: state.allPummockListSlice1,
      searchedPummockList2: state.allPummockListSlice2,
      searchedPummockList3: state.allPummockListSlice3,
    );
  }

  // 품목 검색
  void searchPummock({required String searchWord}) {
    final List<String> fuzzysearchResult1 =
        SimilarCheckHelper.fuzzyHangulSearch(
      state.allPummockListSlice1,
      searchWord,
    );

    final List<String> fuzzysearchResult2 =
        SimilarCheckHelper.fuzzyHangulSearch(
      state.allPummockListSlice2,
      searchWord,
    );

    final List<String> fuzzysearchResult3 =
        SimilarCheckHelper.fuzzyHangulSearch(
      state.allPummockListSlice3,
      searchWord,
    );

    if (searchWord.isEmpty) {
      state = state.copyWith(
        searchedPummockList1: state.allPummockListSlice1,
        searchedPummockList2: state.allPummockListSlice2,
        searchedPummockList3: state.allPummockListSlice3,
      );
      return;
    }

    if (fuzzysearchResult1.length < 10) {
      state = state.copyWith(
        searchedPummockList1: <String>[
          for (int i = 0; i < 10; i++) ...<String>[
            ...fuzzysearchResult1,
            'ㅁ',
          ],
        ],
      );
    }

    if (fuzzysearchResult2.length < 10) {
      state = state.copyWith(
        searchedPummockList2: <String>[
          for (int i = 0; i < 10; i++) ...<String>[
            ...fuzzysearchResult2,
            'ㅁ',
          ],
        ],
      );
    }

    if (fuzzysearchResult3.length < 10) {
      state = state.copyWith(
        searchedPummockList3: <String>[
          for (int i = 0; i < 10; i++) ...<String>[
            ...fuzzysearchResult3,
            'ㅁ',
          ],
        ],
      );
    }

    if (fuzzysearchResult1.isEmpty &&
        fuzzysearchResult2.isEmpty &&
        fuzzysearchResult3.isEmpty) {
      final List<String> notFoundList = <String>[
        for (int i = 0; i < 10; i++) ...<String>[
          '검색 결과가 없습니다.',
          'ㅁ',
        ],
      ];

      state = state.copyWith(
        searchedPummockList1: notFoundList,
        searchedPummockList2: notFoundList,
        searchedPummockList3: notFoundList,
      );
    }
  }
}
