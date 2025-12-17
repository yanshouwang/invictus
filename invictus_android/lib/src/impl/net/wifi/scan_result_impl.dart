import 'dart:typed_data';

import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class ScanResult$InformationElementImpl extends InvictusObjectImpl
    implements ScanResult$InformationElement {
  @override
  final jni.ScanResult$InformationElement api;

  ScanResult$InformationElementImpl.internal(this.api);

  @override
  Uint8List get bytes => api.getBytes().impl;

  @override
  int get id => api.getId();

  @override
  int get idExt => api.getIdExt();
}

final class ScanResultImpl extends InvictusObjectImpl implements ScanResult {
  @override
  final jni.ScanResult api;

  ScanResultImpl.internal(this.api);

  @override
  List<MloLink> get affiliatedMloLinks =>
      api.getAffiliatedMloLinks().nonNulls.map((e) => e.impl).toList();

  @override
  MacAddress? get apMldMacAddress => api.getApMldMacAddress()?.impl;

  @override
  int get apMloLinkId => api.getApMloLinkId();

  @override
  String get bssid => ArgumentError.checkNotNull(api.BSSID, 'BSSID').impl;

  @override
  String get capabilities =>
      ArgumentError.checkNotNull(api.capabilities, 'capabilities').impl;

  @override
  int get centerFreq0 => api.centerFreq0;

  @override
  int get centerFreq1 => api.centerFreq1;

  @override
  ScanResult$ChannelWidth get channelWidth =>
      api.channelWidth.scanResult$ChannelWidthImpl;

  @override
  int get frequency => api.frequency;

  @override
  List<ScanResult$InformationElement> get informationElements =>
      api.getInformationElements().nonNulls.map((e) => e.impl).toList();

  @override
  bool get is80211azNtbResponder => api.is80211azNtbResponder();

  @override
  bool get is80211mcResponder => api.is80211mcResponder();

  @override
  bool get isPasspointNetwork => api.isPasspointNetwork();

  @override
  bool get isRangingFrameProtectionRequired =>
      api.isRangingFrameProtectionRequired();

  @override
  bool get isSecureHeLtfSupported => api.isSecureHeLtfSupported();

  @override
  bool get isTwtResponder => api.isTwtResponder();

  @override
  int get level => api.level;

  @override
  String get operatorFriendlyName => ArgumentError.checkNotNull(
    api.operatorFriendlyName,
    'operatorFriendlyName',
  ).toString();

  @override
  List<WifiInfo$SecurityType> get securityTypes =>
      api.getSecurityTypes().map((e) => e.wifiInfo$SecurityTypeImpl).toList();

  @override
  String get ssid => ArgumentError.checkNotNull(api.SSID, 'SSID').impl;

  @override
  int get timestamp => api.timestamp;

  @override
  String get venueName =>
      ArgumentError.checkNotNull(api.venueName, 'venueName').toString();

  @override
  WifiSsid? get wifiSsid => api.getWifiSsid()?.impl;

  @override
  ScanResult$WifiStandard get wifiStandard =>
      api.getWifiStandard().scanResult$WifiStandardImpl;
}

final class ScanResultChannelImpl extends ScanResultChannel {
  @override
  int convertChannelToFrequencyMhzIfSuppported(
    int channel,
    ScanResult$WifiBand band,
  ) =>
      jni.ScanResult.convertChannelToFrequencyMhzIfSupported(channel, band.api);

  @override
  int convertFrequencyMhzToChannelIfSupported(int freqMhz) =>
      jni.ScanResult.convertFrequencyMhzToChannelIfSupported(freqMhz);
}

extension Invictus$JScanResult$intX on int {
  ScanResult$ChannelWidth get scanResult$ChannelWidthImpl {
    final api = this;
    switch (api) {
      case jni.ScanResult.CHANNEL_WIDTH_20MHZ:
        return ScanResult$ChannelWidth.$20Mhz;
      case jni.ScanResult.CHANNEL_WIDTH_40MHZ:
        return ScanResult$ChannelWidth.$40Mhz;
      case jni.ScanResult.CHANNEL_WIDTH_80MHZ:
        return ScanResult$ChannelWidth.$80Mhz;
      case jni.ScanResult.CHANNEL_WIDTH_160MHZ:
        return ScanResult$ChannelWidth.$160Mhz;
      case jni.ScanResult.CHANNEL_WIDTH_80MHZ_PLUS_MHZ:
        return ScanResult$ChannelWidth.$80MhzPlusMhz;
      case jni.ScanResult.CHANNEL_WIDTH_320MHZ:
        return ScanResult$ChannelWidth.$320Mhz;
      default:
        throw ArgumentError.value(api, 'api');
    }
  }

  ScanResult$WifiBand get scanResult$WifiBandImpl {
    final api = this;
    switch (api) {
      case jni.ScanResult.WIFI_BAND_24_GHZ:
        return ScanResult$WifiBand.$24Ghz;
      case jni.ScanResult.WIFI_BAND_5_GHZ:
        return ScanResult$WifiBand.$5Ghz;
      case jni.ScanResult.WIFI_BAND_6_GHZ:
        return ScanResult$WifiBand.$6Ghz;
      case jni.ScanResult.WIFI_BAND_60_GHZ:
        return ScanResult$WifiBand.$60Ghz;
      default:
        throw ArgumentError.value(api, 'api');
    }
  }

  ScanResult$WifiStandard get scanResult$WifiStandardImpl {
    final api = this;
    switch (api) {
      case jni.ScanResult.WIFI_STANDARD_UNKNOWN:
        return ScanResult$WifiStandard.unknown;
      case jni.ScanResult.WIFI_STANDARD_LEGACY:
        return ScanResult$WifiStandard.legacy;
      case jni.ScanResult.WIFI_STANDARD_11N:
        return ScanResult$WifiStandard.$11N;
      case jni.ScanResult.WIFI_STANDARD_11AC:
        return ScanResult$WifiStandard.$11Ac;
      case jni.ScanResult.WIFI_STANDARD_11AX:
        return ScanResult$WifiStandard.$11Ax;
      case jni.ScanResult.WIFI_STANDARD_11AD:
        return ScanResult$WifiStandard.$11Ad;
      case jni.ScanResult.WIFI_STANDARD_11BE:
        return ScanResult$WifiStandard.$11Be;
      default:
        throw ArgumentError.value(api, 'api');
    }
  }
}

extension Invictus$ScanResult$WifiBandX on ScanResult$WifiBand {
  int get api {
    switch (this) {
      case ScanResult$WifiBand.$24Ghz:
        return jni.ScanResult.WIFI_BAND_24_GHZ;
      case ScanResult$WifiBand.$5Ghz:
        return jni.ScanResult.WIFI_BAND_5_GHZ;
      case ScanResult$WifiBand.$6Ghz:
        return jni.ScanResult.WIFI_BAND_6_GHZ;
      case ScanResult$WifiBand.$60Ghz:
        return jni.ScanResult.WIFI_BAND_60_GHZ;
    }
  }
}

extension Invictus$JScanResult$InformationElementX
    on jni.ScanResult$InformationElement {
  ScanResult$InformationElement get impl =>
      ScanResult$InformationElementImpl.internal(this);
}

extension Invictus$ScanResultX on jni.ScanResult {
  ScanResult get impl => ScanResultImpl.internal(this);
}
