import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;

final class EthernetManager$ListenerImpl extends InvictusObjectImpl
    implements EthernetManager$Listener {
  @override
  final jni.EthernetManager$Listener api;

  EthernetManager$ListenerImpl.internal(this.api);

  factory EthernetManager$ListenerImpl({
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

final class EthernetManagerImpl extends InvictusObjectImpl
    implements EthernetManager {
  @override
  final jni.EthernetManager api;

  EthernetManagerImpl.internal(this.api);

  factory EthernetManagerImpl() {
    final api = jni.EthernetManager(jni.context);
    return EthernetManagerImpl.internal(api);
  }

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

extension Invictus$EthernetManager$ListenerX on EthernetManager$Listener {
  jni.EthernetManager$Listener get api {
    final impl = this;
    if (impl is! EthernetManager$ListenerImpl) throw TypeError();
    return impl.api;
  }
}
