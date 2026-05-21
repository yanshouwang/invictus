import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class BitSetImpl extends ObjectImpl implements BitSet {
  @override
  final jni.BitSet api;

  BitSetImpl.internal(this.api);
}

final class BitSetChannelImpl extends BitSetChannel {
  @override
  BitSet create() {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  BitSet createNbits(int nbits) {
    // TODO: implement createNbits
    throw UnimplementedError();
  }
}
