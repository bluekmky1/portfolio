import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  final List<String> allPummockListSlice1;
  final List<String> allPummockListSlice2;
  final List<String> allPummockListSlice3;
  final List<String> searchedPummockList1;
  final List<String> searchedPummockList2;
  final List<String> searchedPummockList3;
  final List<String> pummockSearchResult;

  const SearchState({
    required this.allPummockListSlice1,
    required this.allPummockListSlice2,
    required this.allPummockListSlice3,
    required this.searchedPummockList1,
    required this.searchedPummockList2,
    required this.searchedPummockList3,
    required this.pummockSearchResult,
  });

  SearchState.init()
      : allPummockListSlice1 = <String>[],
        allPummockListSlice2 = <String>[],
        allPummockListSlice3 = <String>[],
        searchedPummockList1 = <String>[],
        searchedPummockList2 = <String>[],
        searchedPummockList3 = <String>[],
        pummockSearchResult = <String>[];

  SearchState copyWith({
    List<String>? allPummockListSlice1,
    List<String>? allPummockListSlice2,
    List<String>? allPummockListSlice3,
    List<String>? searchedPummockList1,
    List<String>? searchedPummockList2,
    List<String>? searchedPummockList3,
    List<String>? pummockSearchResult,
  }) =>
      SearchState(
        allPummockListSlice1: allPummockListSlice1 ?? this.allPummockListSlice1,
        allPummockListSlice2: allPummockListSlice2 ?? this.allPummockListSlice2,
        allPummockListSlice3: allPummockListSlice3 ?? this.allPummockListSlice3,
        searchedPummockList1: searchedPummockList1 ?? this.searchedPummockList1,
        searchedPummockList2: searchedPummockList2 ?? this.searchedPummockList2,
        searchedPummockList3: searchedPummockList3 ?? this.searchedPummockList3,
        pummockSearchResult: pummockSearchResult ?? this.pummockSearchResult,
      );

  @override
  List<Object> get props => <Object>[
        allPummockListSlice1,
        allPummockListSlice2,
        allPummockListSlice3,
        searchedPummockList1,
        searchedPummockList2,
        searchedPummockList3,
        pummockSearchResult,
      ];
}
