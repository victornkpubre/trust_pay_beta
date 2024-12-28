
extension NonNullString on String? {
  String orEmpty() {
    if (this == null ) {
      return "";
    }
    else {
      return this!;
    }
  }
}

extension NoNullInteger on int? {
  int orZero() {
    if(this == null) {
      return 0;
    }
    else {
      return this!;
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}