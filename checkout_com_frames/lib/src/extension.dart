extension StringCardExtension on String {
  String get removeAllSpace {
    return replaceAll(RegExp(r'\D'), '');
  }

  bool get isNumeric {
    return num.tryParse(this) != null;
  }
}
