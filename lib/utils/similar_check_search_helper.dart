class SimilarCheckHelper {
  static List<String> fuzzyHangulSearch(
    List<String> wordList,
    String searchTerm, {
    int threshold = 1,
  }) {
    final List<String> result = <String>[];

    for (final String word in wordList) {
      if (word.length >= searchTerm.length) {
        final int distance = _calculateFuzzyHangulDistance(
          searchTerm.toLowerCase(),
          word.toLowerCase(),
        );
        if (distance <= threshold) {
          result.add(word);
        }
      }
    }

    result.sort(
      (String a, String b) => _calculateFuzzyHangulDistance(searchTerm, a)
          .compareTo(_calculateFuzzyHangulDistance(searchTerm, b)),
    );

    return result;
  }

  static List<String> _separateHangul(String hangulCharacter) {
    final int codeUnit = hangulCharacter.codeUnitAt(0);

    final int initialConsonantIndex = (codeUnit - 0xAC00) ~/ (21 * 28);
    final int vowelIndex = ((codeUnit - 0xAC00) % (21 * 28)) ~/ 28;
    final int finalConsonantIndex = (codeUnit - 0xAC00) % 28;

    final String initialConsonant =
        String.fromCharCode(initialConsonantIndex + 0x1100);
    final String vowel = String.fromCharCode(vowelIndex + 0x1161);
    final String finalConsonant = finalConsonantIndex == 0
        ? ''
        : String.fromCharCode(finalConsonantIndex + 0x11A7);
    return <String>[initialConsonant, vowel, finalConsonant];
  }

  static int _calculateFuzzyHangulDistance(String a, String b) {
    List<String> aSeparate = <String>[];
    List<String> bSeparate = <String>[];

    for (int i = 0; i < a.length; i++) {
      aSeparate = <String>[...aSeparate, ..._separateHangul(a[i])];
      bSeparate = <String>[...bSeparate, ..._separateHangul(b[i])];
    }

    int distance = 0;

    for (int i = 0; i < a.length * 3; i++) {
      distance += _calculateLevenshteinDistance(aSeparate[i], bSeparate[i]);
    }

    return distance;
  }

  static int _calculateLevenshteinDistance(String a, String b) {
    if (a.isEmpty) {
      return b.length;
    }
    if (b.isEmpty) {
      return a.length;
    }

    final List<List<int>> matrix = List<List<int>>.generate(
      a.length + 1,
      (int i) => List<int>.generate(b.length + 1, (int j) => 0),
    );

    for (int i = 0; i <= a.length; i++) {
      matrix[i][0] = i;
    }

    for (int j = 0; j <= b.length; j++) {
      matrix[0][j] = j;
    }

    for (int i = 1; i <= a.length; i++) {
      for (int j = 1; j <= b.length; j++) {
        final int cost = (a.codeUnitAt(i - 1) != b.codeUnitAt(j - 1)) ? 1 : 0;
        matrix[i][j] = <int>[
          matrix[i - 1][j] + 1,
          matrix[i][j - 1] + 1,
          matrix[i - 1][j - 1] + cost,
        ].reduce((int value, int element) => value < element ? value : element);
      }
    }
    return matrix[a.length][b.length];
  }
}
