import 'dart:typed_data';

import 'package:invictus_api/invictus_api.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

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
  ) => WifiInfoChannel.instance.getDetailedStateOf(suppState);

  factory WifiInfo({
    String? bssid,
    WifiInfo$SecurityType? currentSecurityType,
    int? neworkId,
    int? rssi,
    Uint8List? ssid,
    int? subId,
  }) => WifiInfoChannel.instance.create(
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

abstract base class WifiInfoChannel extends PlatformInterface {
  /// Constructs a [WifiInfoChannel].
  WifiInfoChannel() : super(token: _token);

  static final Object _token = Object();

  static WifiInfoChannel? _instance;

  /// The default instance of [WifiInfoChannel] to use.
  static WifiInfoChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WifiInfoChannel] when
  /// they register themselves.
  static set instance(WifiInfoChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  NetworkInfo$DetailedState getDetailedStateOf(SupplicantState suppState);

  WifiInfo create({
    String? bssid,
    WifiInfo$SecurityType? currentSecurityType,
    int? neworkId,
    int? rssi,
    Uint8List? ssid,
    int? subId,
  });
}
