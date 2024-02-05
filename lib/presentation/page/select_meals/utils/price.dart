
  int extractCents(double price) => ((price * 100) % 100).round();

  String formatCents(int cents) {
    int formattedCents = cents.clamp(0, 99);
    String centsString = formattedCents.toString().padLeft(2, '0');
    return centsString;
  }