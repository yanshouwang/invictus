import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class EthernetManager$ListenerImpl extends ObjectImpl
    implements EthernetManager$Listener {
  @override
  final jni.EthernetManager$Listener api;

  EthernetManager$ListenerImpl.internal(this.api);
}

final class EthernetManagerImpl extends ObjectImpl implements EthernetManager {
  @override
  final jni.EthernetManager api;

  EthernetManagerImpl.internal(this.api);

  @override
  List<String> get availableInterfaces =>
      api.getAvailableInterfaces().map((e) => e.impl).toList();

  @override
  void addListener(EthernetManager$Listener listener) =>
      api.addListener(listener.api);

  @override
  void removeListener(EthernetManager$Listener listener) =>
      api.removeListener(listener.api);

  @override
  bool isAvailable([String? iface]) =>
      iface == null ? api.isAvailable() : api.isAvailable$1(iface.api);

  @override
  IpConfiguration getConfiguration(String iface) =>
      api.getConfiguration(iface.api).impl;

  @override
  void setConfiguration(String iface, IpConfiguration config) =>
      api.setConfiguration(iface.api, config.api);
}

final class EthernetManagerChannelImpl extends EthernetManagerChannel {
  @override
  EthernetManager create() {
    final api = jni.EthernetManager(jni.context);
    return EthernetManagerImpl.internal(api);
  }

  @override
  EthernetManager$Listener createListener({
    required void Function(String iface, bool isAvailable)
    onAvailabilityChanged,
  }) {
    final api = jni.InvictusEthernetManager$InvictusListenerImpl(
      jni.context,
      jni.InvictusEthernetManager$InvictusListener.implement(
        jni.$InvictusEthernetManager$InvictusListener(
          onAvailabilityChanged: (e1, e2) => onAvailabilityChanged(e1.impl, e2),
        ),
      ),
    );
    return EthernetManager$ListenerImpl.internal(api);
  }
}

extension Invictus$EthernetManager$ListenerX on EthernetManager$Listener {
  jni.EthernetManager$Listener get api {
    final impl = this;
    if (impl is! EthernetManager$ListenerImpl) throw TypeError();
    return impl.api;
  }
}
