extension EnumExt on Enum {
  String get toStr {
    return toString().split('.').last;
  }
}