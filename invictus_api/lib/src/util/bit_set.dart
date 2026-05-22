import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class BitSet {
  factory BitSet() => BitSetChannel.instance.create();
  factory BitSet.nbits(int nbits) => BitSetChannel.instance.createNbits(nbits);
  factory BitSet.bytes(Uint8List bytes) =>
      BitSetChannel.instance.valueOfByteArray(bytes);
  factory BitSet.longs(List<int> longs) =>
      BitSetChannel.instance.valueOfLongArray(longs);

  int get cardinality;
  bool get isEmpty;
  int get length;
  int get size;
  // IntStream get stream;

  void and(BitSet set);
  void andNot(BitSet set);
  void clear(int fromIndex, int toIndex);
  void clearAt(int bitIndex);
  void clearAll();
  void flip(int fromIndex, int toIndex);
  void flipAt(int bitIndex);
  BitSet get(int fromIndex, int toIndex);
  bool getAt(int bitIndex);
  bool intersects(BitSet set);
  int nextClearBit(int fromIndex);
  int nextSetBit(int fromIndex);
  void or(BitSet set);
  int previousClearBit(int fromIndex);
  int previousSetBit(int fromIndex);
  void set(int fromIndex, int toIndex, [bool? value]);
  void setAt(int bitIndex, [bool? value]);
  Uint8List toByteArray();
  List<int> toLongArray();
  void xor(BitSet set);
}

abstract base class BitSetChannel extends PlatformInterface {
  /// Constructs a [BitSetChannel].
  BitSetChannel() : super(token: _token);

  static final Object _token = Object();

  static BitSetChannel? _instance;

  /// The default instance of [BitSetChannel] to use.
  static BitSetChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BitSetChannel] when
  /// they register themselves.
  static set instance(BitSetChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  BitSet create();
  BitSet createNbits(int nbits);

  BitSet valueOfByteArray(Uint8List bytes);
  BitSet valueOfLongArray(List<int> longs);
  // BitSet valueOf(ByteBuffer bytes);
  // BitSet valueOf(LongBuffer lb);
}
