import 'dart:async';

import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';
import 'package:logging/logging.dart';

Logger get _logger => Logger('UsbManager');

final class UsbManager$UsbAccessoryListenerImpl extends ObjectImpl
    implements UsbManager$UsbAccessoryListener {
  @override
  final jni.BroadcastReceiver api;

  UsbManager$UsbAccessoryListenerImpl.internal(this.api);
}

final class UsbManager$UsbDeviceListenerImpl extends ObjectImpl
    implements UsbManager$UsbDeviceListener {
  @override
  final jni.BroadcastReceiver api;

  UsbManager$UsbDeviceListenerImpl.internal(this.api);
}

final class UsbManagerImpl extends ObjectImpl implements UsbManager {
  String get actionUsbAccessoryPermission =>
      'dev.zeekr.USB_ACCESSORY_PERMISSION';
  String get actionUsbDevicePermission => 'dev.zeekr.USB_DEVICE_PERMISSION';

  @override
  final jni.UsbManager api;

  UsbManagerImpl.internal(this.api);

  @override
  void registerAccessoryListener(UsbManager$UsbAccessoryListener listener) {
    jni.ContextCompat.registerReceiver(
      jni.context,
      listener.api,
      jni.IntentFilter()
        ..addAction(jni.UsbManager.ACTION_USB_ACCESSORY_ATTACHED)
        ..addAction(jni.UsbManager.ACTION_USB_ACCESSORY_DETACHED),
      jni.ContextCompat.RECEIVER_NOT_EXPORTED,
    );
  }

  @override
  void unregisterAccessoryListener(UsbManager$UsbAccessoryListener listener) {
    jni.context.unregisterReceiver(listener.api);
  }

  @override
  void registerDeviceListener(UsbManager$UsbDeviceListener listener) {
    jni.ContextCompat.registerReceiver(
      jni.context,
      listener.api,
      jni.IntentFilter()
        ..addAction(jni.UsbManager.ACTION_USB_DEVICE_ATTACHED)
        ..addAction(jni.UsbManager.ACTION_USB_DEVICE_DETACHED),
      jni.ContextCompat.RECEIVER_NOT_EXPORTED,
    );
  }

  @override
  void unregisterDeviceListener(UsbManager$UsbDeviceListener listener) {
    jni.context.unregisterReceiver(listener.api);
  }

  @override
  List<UsbAccessory> getAccessoryList() =>
      api.getAccessoryList()?.nonNulls.map((e) => e.impl).toList() ?? [];

  @override
  Map<String, UsbDevice> getDeviceList() {
    final devicesApiOrNull = api.getDeviceList();
    final devicesApi = ArgumentError.checkNotNull(
      devicesApiOrNull,
      'devicesApi',
    );
    return devicesApi
        .as(jni.JMap.type(jni.JString.type, jni.UsbDevice.type))
        .map((key, value) => MapEntry(key.impl, value.impl));
  }

  @override
  bool hasAccessoryPermission(UsbAccessory accessory) =>
      api.hasPermission(accessory.api);

  @override
  bool hasDevicePermission(UsbDevice device) => api.hasPermission$1(device.api);

  @override
  ParcelFileDescriptor openAccessory(UsbAccessory accessory) {
    final descriptorApiOrNull = api.openAccessory(accessory.api);
    final descriptorApi = ArgumentError.checkNotNull(
      descriptorApiOrNull,
      'descriptorApi',
    );
    return descriptorApi.impl;
  }

  @override
  InputStream openAccessoryInputStream(UsbAccessory accessory) =>
      api.openAccessoryInputStream(accessory.api).impl;

  @override
  OutputStream openAccessoryOutputStream(UsbAccessory accessory) =>
      api.openAccessoryOutputStream(accessory.api).impl;

  @override
  UsbDeviceConnection openDevice(UsbDevice device) {
    final connectionApiOrNull = api.openDevice(device.api);
    final connectionApi = ArgumentError.checkNotNull(
      connectionApiOrNull,
      'connectionApi',
    );
    return connectionApi.impl;
  }

  @override
  Future<bool> requestAccessoryPermission(UsbAccessory accessory) {
    final completer = Completer<bool>();
    final receiverApi = jni.InvictusBroadcastReceiverImpl(
      jni.InvictusBroadcastReceiver.implement(
        jni.$InvictusBroadcastReceiver(
          onReceive: (context, intent) {
            if (intent == null) {
              _logger.warning('intent is null');
              return;
            }
            final action = intent.action?.impl;
            if (action != actionUsbAccessoryPermission) return;
            final accessoryApi = jni.IntentCompat.getParcelableExtra(
              intent,
              jni.UsbManager.EXTRA_ACCESSORY,
              jni.UsbAccessory.type.jClass,
              T: jni.UsbAccessory.type,
            );
            if (accessoryApi != accessory.api) return;
            final isGranted = intent.getBooleanExtra(
              jni.UsbManager.EXTRA_PERMISSION_GRANTED,
              false,
            );
            completer.complete(isGranted);
          },
        ),
      ),
    );
    jni.ContextCompat.registerReceiver(
      jni.context,
      receiverApi,
      jni.IntentFilter.new$2(actionUsbAccessoryPermission.api),
      jni.ContextCompat.RECEIVER_NOT_EXPORTED,
    );
    api.requestPermission(
      accessory.api,
      jni.PendingIntent.getBroadcast(
        jni.context,
        0,
        jni.Intent.new$3(actionUsbAccessoryPermission.api)
          ..setPackage(jni.context.packageName),
        jni.PendingIntent.FLAG_MUTABLE,
      ),
    );
    return completer.future.whenComplete(
      () => jni.context.unregisterReceiver(receiverApi),
    );
  }

  @override
  Future<bool> requestDevicePermission(UsbDevice device) {
    final completer = Completer<bool>();
    final receiverApi = jni.InvictusBroadcastReceiverImpl(
      jni.InvictusBroadcastReceiver.implement(
        jni.$InvictusBroadcastReceiver(
          onReceive: (context, intent) {
            if (intent == null) {
              _logger.warning('intent is null');
              return;
            }
            final action = intent.action?.impl;
            if (action != actionUsbDevicePermission) return;
            final deviceApi = jni.IntentCompat.getParcelableExtra(
              intent,
              jni.UsbManager.EXTRA_DEVICE,
              jni.UsbDevice.type.jClass,
              T: jni.UsbDevice.type,
            );
            if (deviceApi != device.api) return;
            final isGranted = intent.getBooleanExtra(
              jni.UsbManager.EXTRA_PERMISSION_GRANTED,
              false,
            );
            completer.complete(isGranted);
          },
        ),
      ),
    );
    jni.ContextCompat.registerReceiver(
      jni.context,
      receiverApi,
      jni.IntentFilter.new$2(actionUsbDevicePermission.api),
      jni.ContextCompat.RECEIVER_NOT_EXPORTED,
    );
    api.requestPermission$1(
      device.api,
      jni.PendingIntent.getBroadcast(
        jni.context,
        0,
        jni.Intent.new$3(actionUsbDevicePermission.api)
          ..setPackage(jni.context.packageName),
        jni.PendingIntent.FLAG_MUTABLE,
      ),
    );
    return completer.future.whenComplete(
      () => jni.context.unregisterReceiver(receiverApi),
    );
  }
}

final class UsbManagerChannelImpl extends UsbManagerChannel {
  @override
  UsbManager create() {
    final apiOrNull = jni.ContextCompat.getSystemService(
      jni.context,
      jni.UsbManager.type.jClass,
      T: jni.UsbManager.type,
    );
    final api = ArgumentError.checkNotNull(apiOrNull, 'api');
    return UsbManagerImpl.internal(api);
  }

  @override
  UsbManager$UsbAccessoryListener createAccessoryListener({
    required void Function(UsbAccessory accessory) onAttached,
    required void Function(UsbAccessory accessory) onDetached,
  }) {
    final api = jni.InvictusBroadcastReceiverImpl(
      jni.InvictusBroadcastReceiver.implement(
        jni.$InvictusBroadcastReceiver(
          onReceive: (context, intent) {
            if (intent == null) {
              _logger.warning('intent is null');
              return;
            }
            final action = intent.action;
            if (action != jni.UsbManager.ACTION_USB_ACCESSORY_ATTACHED &&
                action != jni.UsbManager.ACTION_USB_ACCESSORY_DETACHED) {
              return;
            }
            final accessory = jni.IntentCompat.getParcelableExtra(
              intent,
              jni.UsbManager.EXTRA_ACCESSORY,
              jni.UsbAccessory.type.jClass,
              T: jni.UsbAccessory.type,
            );
            if (accessory == null) {
              _logger.warning('accessory is null');
              return;
            }
            if (action == jni.UsbManager.ACTION_USB_ACCESSORY_ATTACHED) {
              onAttached(accessory.impl);
            } else {
              onDetached(accessory.impl);
            }
          },
        ),
      ),
    );
    return UsbManager$UsbAccessoryListenerImpl.internal(api);
  }

  @override
  UsbManager$UsbDeviceListener createDeviceListener({
    required void Function(UsbDevice device) onAttached,
    required void Function(UsbDevice device) onDetached,
  }) {
    final api = jni.InvictusBroadcastReceiverImpl(
      jni.InvictusBroadcastReceiver.implement(
        jni.$InvictusBroadcastReceiver(
          onReceive: (context, intent) {
            if (intent == null) {
              _logger.warning('intent is null');
              return;
            }
            final action = intent.action;
            if (action != jni.UsbManager.ACTION_USB_DEVICE_ATTACHED &&
                action != jni.UsbManager.ACTION_USB_DEVICE_DETACHED) {
              return;
            }
            final device = jni.IntentCompat.getParcelableExtra(
              intent,
              jni.UsbManager.EXTRA_DEVICE,
              jni.UsbDevice.type.jClass,
              T: jni.UsbDevice.type,
            );
            if (device == null) {
              _logger.warning('device is null');
              return;
            }
            if (action == jni.UsbManager.ACTION_USB_DEVICE_ATTACHED) {
              onAttached(device.impl);
            } else {
              onDetached(device.impl);
            }
          },
        ),
      ),
    );
    return UsbManager$UsbDeviceListenerImpl.internal(api);
  }
}

extension on UsbManager$UsbAccessoryListener {
  jni.BroadcastReceiver get api {
    final impl = this;
    if (impl is! UsbManager$UsbAccessoryListenerImpl) throw TypeError();
    return impl.api;
  }
}

extension on UsbManager$UsbDeviceListener {
  jni.BroadcastReceiver get api {
    final impl = this;
    if (impl is! UsbManager$UsbDeviceListenerImpl) throw TypeError();
    return impl.api;
  }
}
