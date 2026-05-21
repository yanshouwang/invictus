import 'dart:typed_data';

import 'package:invictus_android/src/impl.dart';
import 'package:invictus_android/src/jni.dart' as jni;
import 'package:invictus_api/invictus_api.dart';

final class WifiInfoImpl extends TransportInfoImpl implements WifiInfo {
  @override
  final jni.WifiInfo api;

  WifiInfoImpl.internal(this.api);

  @override
  List<MloLink> get affiliatedMloLinks =>
      api.affiliatedMloLinks.asDart().nonNulls.map((e) => e.impl).toList();

  @override
  MacAddress? get apMldMacAddress => api.apMldMacAddress?.impl;

  @override
  int get apMloLinkId => api.apMloLinkId;

  @override
  int get applicableRedactions => api.applicableRedactions;

  @override
  List<MloLink> get associatedMloLinks =>
      api.associatedMloLinks.asDart().nonNulls.map((e) => e.impl).toList();

  @override
  String get bssid {
    final bssidApiOrNull = api.bSSID;
    final bssidApi = ArgumentError.checkNotNull(bssidApiOrNull, 'bssidApi');
    return bssidApi.impl;
  }

  @override
  WifiInfo$SecurityType get currentSecurityType =>
      api.currentSecurityType.wifiInfo$SecurityTypeImpl;

  @override
  int get frequency => api.frequency;

  @override
  bool get hiddenSSID => api.hiddenSSID;

  @override
  List<ScanResult$InformationElement>? get informationElements =>
      api.informationElements?.asDart().nonNulls.map((e) => e.impl).toList();

  @override
  int get ipAddress => api.ipAddress;

  @override
  bool get isRestricted => api.isRestricted;

  @override
  int get linkSpeed => api.linkSpeed;

  @override
  String get macAddress {
    final macAddressApiOrNull = api.macAddress;
    final macAddressApi = ArgumentError.checkNotNull(
      macAddressApiOrNull,
      'macAddressApi',
    );
    return macAddressApi.impl;
  }

  @override
  WifiInfo makeCopy(int redactions) => api.makeCopy(redactions).impl;

  @override
  int get maxSupportedRxLinkSpeedMbps => api.maxSupportedRxLinkSpeedMbps;

  @override
  int get maxSupportedTxLinkSpeedMbps => api.maxSupportedTxLinkSpeedMbps;

  @override
  int get networkId => api.networkId;

  @override
  String? get passpointFqdn => api.passpointFqdn?.impl;

  @override
  String? get passpointProviderFriendlyName =>
      api.passpointProviderFriendlyName?.impl;

  @override
  String? get passpointUniqueId => api.passpointUniqueId?.impl;

  @override
  int get rssi => api.rssi;

  @override
  int get rxLinkSpeedMbps => api.rxLinkSpeedMbps;

  @override
  String get ssid {
    final ssidApiOrNull = api.sSID;
    final ssidApi = ArgumentError.checkNotNull(ssidApiOrNull, 'ssidApi');
    return ssidApi.impl;
  }

  @override
  int get subscriptionId => api.subscriptionId;

  @override
  SupplicantState get supplicantState {
    final supplicantStateApiOrNull = api.supplicantState;
    final supplicantStateApi = ArgumentError.checkNotNull(
      supplicantStateApiOrNull,
      'supplicantStateApi',
    );
    return supplicantStateApi.impl;
  }

  @override
  int get txLinkSpeedMbps => api.txLinkSpeedMbps;

  @override
  int get wifiStandard => api.wifiStandard;
}

final class WifiInfoChannelImpl extends WifiInfoChannel {
  @override
  NetworkInfo$DetailedState getDetailedStateOf(SupplicantState suppState) {
    final detailedStateApiOrNull = jni.WifiInfo.getDetailedStateOf(
      suppState.api,
    );
    final detailedStateApi = ArgumentError.checkNotNull(
      detailedStateApiOrNull,
      'detailedStateApi',
    );
    return detailedStateApi.impl;
  }

  @override
  WifiInfo create({
    String? bssid,
    WifiInfo$SecurityType? currentSecurityType,
    int? neworkId,
    int? rssi,
    Uint8List? ssid,
    int? subId,
  }) {
    final builder = jni.WifiInfo$Builder();
    if (bssid != null) builder.setBssid(bssid.api);
    if (currentSecurityType != null) {
      builder.setCurrentSecurityType(currentSecurityType.api);
    }
    if (neworkId != null) builder.setNetworkId(neworkId);
    if (rssi != null) builder.setRssi(rssi);
    if (ssid != null) builder.setSsid(ssid.byteArrayApi);
    if (subId != null) builder.setSubscriptionId(subId);
    final api = builder.build();
    return WifiInfoImpl.internal(api);
  }
}

extension Invictus$WifiInfo$SecurityTypeX on WifiInfo$SecurityType {
  int get api {
    switch (this) {
      case WifiInfo$SecurityType.unknown:
        return jni.WifiInfo.SECURITY_TYPE_UNKNOWN;
      case WifiInfo$SecurityType.open:
        return jni.WifiInfo.SECURITY_TYPE_OPEN;
      case WifiInfo$SecurityType.wep:
        return jni.WifiInfo.SECURITY_TYPE_WEP;
      case WifiInfo$SecurityType.psk:
        return jni.WifiInfo.SECURITY_TYPE_PSK;
      case WifiInfo$SecurityType.eap:
        return jni.WifiInfo.SECURITY_TYPE_EAP;
      case WifiInfo$SecurityType.sae:
        return jni.WifiInfo.SECURITY_TYPE_SAE;
      case WifiInfo$SecurityType.eapWpa3Enterprise192Bit:
        return jni.WifiInfo.SECURITY_TYPE_EAP_WPA3_ENTERPRISE_192_BIT;
      case WifiInfo$SecurityType.owe:
        return jni.WifiInfo.SECURITY_TYPE_OWE;
      case WifiInfo$SecurityType.wapiPsk:
        return jni.WifiInfo.SECURITY_TYPE_WAPI_PSK;
      case WifiInfo$SecurityType.wapiCert:
        return jni.WifiInfo.SECURITY_TYPE_WAPI_CERT;
      case WifiInfo$SecurityType.eapWpa3Enterprise:
        return jni.WifiInfo.SECURITY_TYPE_EAP_WPA3_ENTERPRISE;
      case WifiInfo$SecurityType.osen:
        return jni.WifiInfo.SECURITY_TYPE_OSEN;
      case WifiInfo$SecurityType.passpointR1R2:
        return jni.WifiInfo.SECURITY_TYPE_PASSPOINT_R1_R2;
      case WifiInfo$SecurityType.passpointR3:
        return jni.WifiInfo.SECURITY_TYPE_PASSPOINT_R3;
      case WifiInfo$SecurityType.dpp:
        return jni.WifiInfo.SECURITY_TYPE_DPP;
    }
  }
}

extension Invictus$JWifiInfo$intX on int {
  WifiInfo$SecurityType get wifiInfo$SecurityTypeImpl {
    final api = this;
    switch (api) {
      case jni.WifiInfo.SECURITY_TYPE_UNKNOWN:
        return WifiInfo$SecurityType.unknown;
      case jni.WifiInfo.SECURITY_TYPE_OPEN:
        return WifiInfo$SecurityType.open;
      case jni.WifiInfo.SECURITY_TYPE_WEP:
        return WifiInfo$SecurityType.wep;
      case jni.WifiInfo.SECURITY_TYPE_PSK:
        return WifiInfo$SecurityType.psk;
      case jni.WifiInfo.SECURITY_TYPE_EAP:
        return WifiInfo$SecurityType.eap;
      case jni.WifiInfo.SECURITY_TYPE_SAE:
        return WifiInfo$SecurityType.sae;
      case jni.WifiInfo.SECURITY_TYPE_EAP_WPA3_ENTERPRISE_192_BIT:
        return WifiInfo$SecurityType.eapWpa3Enterprise192Bit;
      case jni.WifiInfo.SECURITY_TYPE_OWE:
        return WifiInfo$SecurityType.owe;
      case jni.WifiInfo.SECURITY_TYPE_WAPI_PSK:
        return WifiInfo$SecurityType.wapiPsk;
      case jni.WifiInfo.SECURITY_TYPE_WAPI_CERT:
        return WifiInfo$SecurityType.wapiCert;
      case jni.WifiInfo.SECURITY_TYPE_EAP_WPA3_ENTERPRISE:
        return WifiInfo$SecurityType.eapWpa3Enterprise;
      case jni.WifiInfo.SECURITY_TYPE_OSEN:
        return WifiInfo$SecurityType.osen;
      case jni.WifiInfo.SECURITY_TYPE_PASSPOINT_R1_R2:
        return WifiInfo$SecurityType.passpointR1R2;
      case jni.WifiInfo.SECURITY_TYPE_PASSPOINT_R3:
        return WifiInfo$SecurityType.passpointR3;
      case jni.WifiInfo.SECURITY_TYPE_DPP:
        return WifiInfo$SecurityType.dpp;
      default:
        throw ArgumentError.value(api, 'api');
    }
  }
}

extension Invictus$JWifiInfoX on jni.WifiInfo {
  WifiInfo get impl => WifiInfoImpl.internal(this);
}
