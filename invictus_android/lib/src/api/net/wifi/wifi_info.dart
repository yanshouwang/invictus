import 'dart:typed_data';

import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';

enum WifiInfo$SecurityType {
  unknown, // -1
  open, // 0
  wep, // 1
  psk, // 2
  eap, // 3
  sae, // 4
  eapWpa3Enterprise192Bit, //
  owe, // 6
  wapiPsk, // 7
  wapiCert, // 8
  eapWpa3Enterprise, // 9
  osen, // 10
  passpointR1R2, // 11
  passpointR3, // 12
  dpp, // 13
}

abstract interface class WifiInfo implements TransportInfo {
  static NetworkInfo$DetailedState getDetailedStateOf(
    SupplicantState suppState,
  ) => WifiInfoImpl.getDetailedStateOf(suppState);

  factory WifiInfo({
    String? bssid,
    WifiInfo$SecurityType? currentSecurityType,
    int? neworkId,
    int? rssi,
    Uint8List? ssid,
    int? subId,
  }) => WifiInfoImpl(
    bssid: bssid,
    currentSecurityType: currentSecurityType,
    neworkId: neworkId,
    rssi: rssi,
    ssid: ssid,
    subId: subId,
  );

  List<MloLink> get affiliatedMloLinks;
  MacAddress? get apMldMacAddress;
  int get apMloLinkId;
  int get applicableRedactions;
  List<MloLink> get associatedMloLinks;
  String get bssid;
  WifiInfo$SecurityType get currentSecurityType;
  int get frequency;
  bool get hiddenSSID;
  List<ScanResult$InformationElement>? get informationElements;
  int get ipAddress;
  int get linkSpeed;
  String get macAddress;
  int get maxSupportedRxLinkSpeedMbps;
  int get maxSupportedTxLinkSpeedMbps;
  int get networkId;
  String? get passpointFqdn;
  String? get passpointProviderFriendlyName;
  String? get passpointUniqueId;
  int get rssi;
  int get rxLinkSpeedMbps;
  String get ssid;
  int get subscriptionId;
  SupplicantState get supplicantState;
  int get txLinkSpeedMbps;
  int get wifiStandard;
  bool get isRestricted;
  WifiInfo makeCopy(int redactions);
}
