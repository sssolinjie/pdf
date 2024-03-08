/// Emulation of Java Enum class.
///
/// Example:
///
/// ```dart
/// class Meter<int> extends Enum<int> {
///
///  const Meter(int val) : super (val);
///
///  static const Meter HIGH = const Meter(100);
///  static const Meter MIDDLE = const Meter(50);
///  static const Meter LOW = const Meter(10);
/// }
///
/// // and usage:
///
/// assert(Meter.HIGH, 100);
/// assert(Meter.HIGH is Meter);
/// ```
abstract class Enum<T> {
  final T _value;

  const Enum(this._value);

  T get value => _value;

  @override
  bool operator ==(dynamic other) => other is Enum && other.value == value;
}

/// Throws if [values] or [key] gives null
class EnumValueInvalidParamsException implements Exception {}

/// Returns enum value by string
///
/// Example:
///
/// ```dart
/// enum Enum {
///   one,
///   two,
/// }
///
/// assert(enumValueByString(Enum.values, 'one'), Enum.one);
/// ```
T? enumValueByString<T>(List<T>? values, String? key, {T Function()? orElse}) {
  if (values == null || key == null) {
    if (orElse != null) {
      return orElse();
    } else {
      throw EnumValueInvalidParamsException();
    }
  }

  for (T item in values) {
    // Remove Enum name from enum item
    final String itemName = item.toString().replaceFirst(RegExp(r'.+(\.)'), '');

    if (itemName.toLowerCase() == key.toLowerCase()) {
      return item;
    }
  }

  return null;
}
