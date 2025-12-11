import 'dart:typed_data';

import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';

enum ScanResult$ChannelWidth {
  $20Mhz, // 0
  $40Mhz, // 1
  $80Mhz, // 2
  $160Mhz, // 3
  $80MhzPlusMhz, // 4
  $320Mhz, // 5
}

enum ScanResult$Preamble {
  legacy, // 0
  ht, // 1
  vht, // 2
  he, // 3
  eht, // 4
}

enum ScanResult$WifiBand {
  $24Ghz, // 1
  $5Ghz, // 2
  $6Ghz, // 8
  $60Ghz, // 16
}

enum ScanResult$WifiStandard {
  unknown, // 0
  legacy, // 1
  $11N, // 4
  $11Ac, // 5
  $11Ax, // 6
  $11Ad, // 7
  $11Be, // 8
}

abstract interface class ScanResult$InformationElement {
  Uint8List get bytes;
  int get id;
  int get idExt;
}

abstract interface class ScanResult {
  static int convertChannelToFrequencyMhzIfSuppported(
    int channel,
    ScanResult$WifiBand band,
  ) => ScanResultImpl.convertChannelToFrequencyMhzIfSuppported(channel, band);

  static int convertFrequencyMhzToChannelIfSupported(int freqMhz) =>
      ScanResultImpl.convertFrequencyMhzToChannelIfSupported(freqMhz);

  String get bssid;
  @Deprecated('Use getWifiSsid() instead.')
  String get ssid;
  String get capabilities;
  int get centerFreq0;
  int get centerFreq1;
  ScanResult$ChannelWidth get channelWidth;
  int get frequency;
  int get level;
  @Deprecated('Use WifiInfo.getPasspointProviderFriendlyName()')
  String get operatorFriendlyName;
  int get timestamp;
  @Deprecated('This information is not provided')
  String get venueName;

  List<MloLink> get affiliatedMloLinks;
  MacAddress? get apMldMacAddress;
  int get apMloLinkId;
  List<ScanResult$InformationElement> get informationElements;
  List<WifiInfo$SecurityType> get securityTypes;
  WifiSsid? get wifiSsid;
  ScanResult$WifiStandard get wifiStandard;
  bool get is80211azNtbResponder;
  bool get is80211mcResponder;
  bool get isPasspointNetwork;
  bool get isRangingFrameProtectionRequired;
  bool get isSecureHeLtfSupported;
  bool get isTwtResponder;
}
