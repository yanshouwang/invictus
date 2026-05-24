import 'audio_device_info.dart';

abstract interface class AudioRouting {
  AudioDeviceInfo get preferredDevice;
  set preferredDevice(AudioDeviceInfo value);
  AudioDeviceInfo get routedDevice;
  List<AudioDeviceInfo> get routedDevices;

  void addOnRoutingChangedListener(
    AudioRouting$OnRoutingChangedListener listener,
  );

  void removeOnRoutingChangedListener(
    AudioRouting$OnRoutingChangedListener listener,
  );

  bool setPreferredDevice(AudioDeviceInfo deviceInfo);
}

abstract interface class AudioRouting$OnRoutingChangedListener {
  void onRoutingChanged(AudioRouting router);
}
