import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class LinkAddressImpl extends ObjectImpl implements LinkAddress {
  @override
  final jni.LinkAddress api;

  LinkAddressImpl.internal(this.api);

  @override
  InetAddress get address {
    final addressApiOrNull = api.getAddress();
    final addressApi = ArgumentError.checkNotNull(
      addressApiOrNull,
      'addressApi',
    );
    return addressApi.impl;
  }

  @override
  int get flags => api.getFlags();

  @override
  int get prefixLength => api.getPrefixLength();

  @override
  int get scope => api.getScope();
}

final class LinkAddressChannelImpl extends LinkAddressChannel {
  @override
  LinkAddress createByInetAddressPrefixLength(
    InetAddress address,
    int prefixLength,
  ) {
    final invictusApi = jni.InvictusLinkAddress.new$3(
      address.api,
      prefixLength,
    );
    final api = invictusApi.getObj();
    return LinkAddressImpl.internal(api);
  }

  @override
  LinkAddress createByInetAddressPrefixLengthFlagsScope(
    InetAddress address,
    int prefixLength,
    int flags,
    int scope,
  ) {
    final invictusApi = jni.InvictusLinkAddress.new$1(
      address.api,
      prefixLength,
      flags,
      scope,
    );
    final api = invictusApi.getObj();
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
    final invictusApi = jni.InvictusLinkAddress.new$2(
      address.api,
      prefixLength,
      flags,
      scope,
      deprecationTime,
      expirationTime,
    );
    final api = invictusApi.getObj();
    return LinkAddressImpl.internal(api);
  }

  @override
  LinkAddress createByAddress(String address) {
    final invictusApi = jni.InvictusLinkAddress.new$5(address.api);
    final api = invictusApi.getObj();
    return LinkAddressImpl.internal(api);
  }

  @override
  LinkAddress createByAddressFlagsScope(String address, int flags, int scope) {
    final invictusApi = jni.InvictusLinkAddress.new$6(
      address.api,
      flags,
      scope,
    );
    final api = invictusApi.getObj();
    return LinkAddressImpl.internal(api);
  }

  @override
  LinkAddress createByInterfaceAddress(InterfaceAddress address) {
    final invictusApi = jni.InvictusLinkAddress.new$4(address.api);
    final api = invictusApi.getObj();
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
