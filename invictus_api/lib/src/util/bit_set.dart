import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class BitSet {
  factory BitSet() => BitSetChannel.instance.create();
  factory BitSet.nbits(int nbits) => BitSetChannel.instance.createNbits(nbits);
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
}
