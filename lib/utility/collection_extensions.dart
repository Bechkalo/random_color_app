import 'dart:math';

/// Extension class for adding additional methods to List<T>.
extension CollectionExtensions<T> on List<T> {
  /// Method to get a random element from list, if it exist.
  T? getRandom([Random? random]) {
    if (isEmpty) return null;
    final index = (random ?? Random()).nextInt(length);

    return this[index];
  }
}
