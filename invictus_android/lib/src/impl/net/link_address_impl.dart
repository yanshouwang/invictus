import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class LinkAddressImpl extends ObjectImpl implements LinkAddress {
  @override
  final jni.LinkAddress api;

  LinkAddressImpl.internal(this.api);

  @override
  InetAddress get address {
    final addressApiOrNull = api.address;
    final addressApi = ArgumentError.checkNotNull(
      addressApiOrNull,
      'addressApi',
    );
    return addressApi.impl;
  }

  @override
  int get flags => api.flags;

  @override
  int get prefixLength => api.prefixLength;

  @override
  int get scope => api.scope;
}

final class LinkAddressChannelImpl extends LinkAddressChannel {
  @override
  LinkAddress createByInetAddressPrefixLength(
    InetAddress address,
    int prefixLength,
  ) {
    final api = jni.LinkAddressCompat.INSTANCE.create$2(
      address.api,
      prefixLength,
    );
    return LinkAddressImpl.internal(api);
  }

  @override
  LinkAddress createByInetAddressPrefixLengthFlagsScope(
    InetAddress address,
    int prefixLength,
    int flags,
    int scope,
  ) {
    final api = jni.LinkAddressCompat.INSTANCE.create(
      address.api,
      prefixLength,
      flags,
      scope,
    );
    return LinkAddressImpl.internal(api);
  }

  @override
  LinkAddress
  createByInetAddressPrefixLengthFlagsScopeDeprecationTimeExpirationTime(
    InetAddress address,
    int prefixLength,
    int flags,
    int scope,
    int deprecationTime,
    int expirationTime,
  ) {
    final api = jni.LinkAddressCompat.INSTANCE.create$1(
      address.api,
      prefixLength,
      flags,
      scope,
      deprecationTime,
      expirationTime,
    );
    return LinkAddressImpl.internal(api);
  }

  @override
  LinkAddress createByAddress(String address) {
    final api = jni.LinkAddressCompat.INSTANCE.create$4(address.api);
    return LinkAddressImpl.internal(api);
  }

  @override
  LinkAddress createByAddressFlagsScope(String address, int flags, int scope) {
    final api = jni.LinkAddressCompat.INSTANCE.create$5(
      address.api,
      flags,
      scope,
    );
    return LinkAddressImpl.internal(api);
  }

  @override
  LinkAddress createByInterfaceAddress(InterfaceAddress address) {
    final api = jni.LinkAddressCompat.INSTANCE.create$3(address.api);
    return LinkAddressImpl.internal(api);
  }
}

extension Invictus$LinkAddressX on LinkAddress {
  jni.LinkAddress get api {
    final impl = this;
    if (impl is! LinkAddressImpl) throw TypeError();
    return impl.api;
  }
}

extension Invictus$JLinkAddressX on jni.LinkAddress {
  LinkAddress get impl => LinkAddressImpl.internal(this);
}
