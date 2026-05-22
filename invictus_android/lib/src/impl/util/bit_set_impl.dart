import 'dart:typed_data';

import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class BitSetImpl extends ObjectImpl implements BitSet {
  @override
  final jni.BitSet api;

  BitSetImpl.internal(this.api);

  @override
  int get cardinality => api.cardinality();
  @override
  bool get isEmpty => api.isEmpty;
  @override
  int get length => api.length();
  @override
  int get size => api.size();

  @override
  void and(BitSet set) => api.and(set.api);

  @override
  void andNot(BitSet set) => api.andNot(set.api);

  @override
  void clear(int fromIndex, int toIndex) => api.clear$2(fromIndex, toIndex);

  @override
  void clearAll() => api.clear();

  @override
  void clearAt(int bitIndex) => api.clear$1(bitIndex);

  @override
  void flip(int fromIndex, int toIndex) => api.flip$1(fromIndex, toIndex);

  @override
  void flipAt(int bitIndex) => api.flip(bitIndex);

  @override
  BitSet get(int fromIndex, int toIndex) {
    final setApiOrNull = api.get$1(fromIndex, toIndex);
    final setApi = ArgumentError.checkNotNull(setApiOrNull, 'setApi');
    return setApi.impl;
  }

  @override
  bool getAt(int bitIndex) => api.get(bitIndex);

  @override
  bool intersects(BitSet set) => api.intersects(set.api);

  @override
  int nextClearBit(int fromIndex) => api.nextClearBit(fromIndex);

  @override
  int nextSetBit(int fromIndex) => api.nextSetBit(fromIndex);

  @override
  void or(BitSet set) => api.or(set.api);

  @override
  int previousClearBit(int fromIndex) => api.previousClearBit(fromIndex);

  @override
  int previousSetBit(int fromIndex) => api.previousSetBit(fromIndex);

  @override
  void set(int fromIndex, int toIndex, [bool? value]) => value == null
      ? api.set$2(fromIndex, toIndex)
      : api.set$3(fromIndex, toIndex, value);

  @override
  void setAt(int bitIndex, [bool? value]) =>
      value == null ? api.set(bitIndex) : api.set$1(bitIndex, value);

  @override
  Uint8List toByteArray() {
    final bytesApiOrNull = api.toByteArray();
    final bytesApi = ArgumentError.checkNotNull(bytesApiOrNull, 'bytesApi');
    return bytesApi.impl;
  }

  @override
  List<int> toLongArray() {
    final longsApiOrNull = api.toLongArray();
    final longsApi = ArgumentError.checkNotNull(longsApiOrNull, 'longsApi');
    return longsApi.asDart();
  }

  @override
  void xor(BitSet set) => api.xor(set.api);
}

final class BitSetChannelImpl extends BitSetChannel {
  @override
  BitSet create() {
    final api = jni.BitSet();
    return BitSetImpl.internal(api);
  }

  @override
  BitSet createNbits(int nbits) {
    final api = jni.BitSet.new$1(nbits);
    return BitSetImpl.internal(api);
  }

  @override
  BitSet valueOfByteArray(Uint8List bytes) {
    final apiOrNull = jni.BitSet.valueOf(bytes.byteArrayApi);
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return BitSetImpl.internal(api);
  }

  @override
  BitSet valueOfLongArray(List<int> longs) {
    final apiOrNull = jni.BitSet.valueOf$3(longs.longArrayApi);
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return BitSetImpl.internal(api);
  }
}

extension Invictus$BitSetX on BitSet {
  jni.BitSet get api {
    final impl = this;
    if (impl is! BitSetImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JBitSetX on jni.BitSet {
  BitSetImpl get impl => BitSetImpl.internal(this);
}
