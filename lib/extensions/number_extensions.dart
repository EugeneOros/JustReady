extension NumberExtension on double? {
  int get decimalPart {
    String numberAsString = toString();

    int decimalIndex = numberAsString.indexOf('.');

    // Extract the decimal part
    String decimalPart = decimalIndex != -1 ? numberAsString.substring(decimalIndex + 1) : '0';

    return int.tryParse(decimalPart) ?? 0;
  }
}
