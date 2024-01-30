extension NullableStringExtensions on String? {
  bool get isMapFormat {
    if (this == null) return false;

    const pattern = r'^\{.+\}$';

    return RegExp(pattern).hasMatch(this!);
  }
}
