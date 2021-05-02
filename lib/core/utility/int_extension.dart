extension IntExtension on int {
  /// Returns the comma separated representation of an integer. 
  /// This makes reading big integers much easier for the user.
  /// Example:
  /// 10000000000 becomes 10,000,000,000
  String toCommaSeparatedString() {
    final val = toString();
    final length = val.length;

    var sep = '';
    for (var i = length - 1; i >= 0; i--) {
      final j = length - i;
      final c = val[i];

      sep = '$c$sep';

      if (j % 3 == 0 && j != length) {
        sep = ',$sep';
      }
    }

    return sep;
  } 
}