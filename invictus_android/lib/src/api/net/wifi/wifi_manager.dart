import 'package:invictus_android/src/api.dart';
import 'package:invictus_android/src/impl.dart';

enum WifiManager$WifiState {
  disabling, // 0
  disabled, // 1
  enabling, // 2
  enabled, // 3
  unknown, // 4
}

abstract interface class WifiManager$WifiStateChangedListener {
  factory WifiManager$WifiStateChangedListener({
    required void Function() onWifiStateChanged,
  }) => WifiManager$WifiStateChangedListenerImpl(
    onWifiStateChanged: onWifiStateChanged,
  );
}

abstract interface class WifiManager$ScanResultsCallback {
  factory WifiManager$ScanResultsCallback({
    required void Function() onScanResultsAvailable,
  }) => WifiManager$ScanResultsCallbackImpl(
    onScanResultsAvailable: onScanResultsAvailable,
  );
}

abstract interface class WifiManager {
  factory WifiManager() => WifiManagerImpl();

  @Deprecated(
    'a) See WifiNetworkSpecifier.Builder.build() for new mechanism to trigger connection to a Wi-Fi network. b) See addNetworkSuggestions(java.util.List), removeNetworkSuggestions(java.util.List) for new API to add Wi-Fi networks for consideration when auto-connecting to wifi. Compatibility Note: For applications targeting android.os.Build.VERSION_CODES#Q or above, this API will always fail and return an empty list.',
  )
  List<WifiConfiguration> get configuredNetworks;
  @Deprecated(
    'Starting with Build.VERSION_CODES.S, WifiInfo retrieval is moved to ConnectivityManager API surface. WifiInfo is attached in NetworkCapabilities.getTransportInfo() which is available via callback in NetworkCallback.onCapabilitiesChanged(Network, NetworkCapabilities) or on-demand from ConnectivityManager.getNetworkCapabilities(Network).',
  )
  WifiInfo get connectionInfo;
  @Deprecated(
    'Use the methods on android.net.LinkProperties which can be obtained either via NetworkCallback.onLinkPropertiesChanged(Network, LinkProperties) or ConnectivityManager.getLinkProperties(Network).',
  )
  DhcpInfo get dhcpInfo;
  bool get isWifiEnabled;
  List<ScanResult> get scanResults;
  WifiManager$WifiState get wifiState;

  // static int calculateSignalLevel(int rssi, int numLevels) =>
  //     WifiManagerImpl.calculateSignalLevel(rssi, numLevels);

  // static int compareSignalLevel(int rssiA, int rssiB) =>
  //     WifiManagerImpl.compareSignalLevel(rssiA, rssiB);

  // void addLocalOnlyConnectionFailureListener(
  //   WifiManager$LocalOnlyConnectionFailureListener
  //   addLocalOnlyConnectionFailureListener,
  // );

  @Deprecated(
    'a) See WifiNetworkSpecifier.Builder.build() for new mechanism to trigger connection to a Wi-Fi network. b) See addNetworkSuggestions(java.util.List), removeNetworkSuggestions(java.util.List) for new API to add Wi-Fi networks for consideration when auto-connecting to wifi. Compatibility Note: For applications targeting android.os.Build.VERSION_CODES#Q or above, this API will always fail and return -1.',
  )
  int addNetwork(WifiConfiguration config);

  // WifiManagerAddNetworkResult addNetworkPrivileged(WifiConfiguration config);
  // int addNetworkSuggestions(List<WifiNetworkSuggestion> networkSuggestions);
  // void addOrUpdatePasspointConfiguration(PasspointConfiguration config);
  // void addSuggestionConnectionStatusListener(
  //   WifiManagerSuggestionConnectionStatusListener listener,
  // );
  // void addSuggestionUserApprovalStatusListener(
  //   WifiManagerSuggestionUserApprovalStatusListener listener,
  // );
  void addWifiStateChangedListener(
    WifiManager$WifiStateChangedListener listener,
  );
  // void allowAutojoinGlobal(bool allowAutojoin);
  @Deprecated(
    'Callers should use calculateSignalLevel(int) instead to get the signal level using the system default RSSI thresholds, or otherwise compute the RSSI level themselves using their own formula.',
  )
  int calculateSignalLevel(int rssi);
  // @Deprecated('This API is deprecated')
  // void cancelWps(WifiManagerWpsCallback listener);
  // WifiManagerMulticastLock createMulticastLock(String tag);
  // WifiManagerWifiLock createWifiLock(WifiManagerWifiMode lockType, String tag);
  // @Deprecated('This API is non-functional.')
  // WifiManagerWifiLock createWifiLock(String tag);
  @Deprecated(
    'a) See WifiNetworkSpecifier.Builder.build() for new mechanism to trigger connection to a Wi-Fi network. b) See addNetworkSuggestions(java.util.List), removeNetworkSuggestions(java.util.List) for new API to add Wi-Fi networks for consideration when auto-connecting to wifi. Compatibility Note: For applications targeting android.os.Build.VERSION_CODES#Q or above, this API will always fail and return false.',
  )
  bool disableNetwork(int netId);
  // void disallowCurrentSuggestedNetwork(BlockingOption blockingOption);
  @Deprecated(
    'a) See WifiNetworkSpecifier.Builder.build() for new mechanism to trigger connection to a Wi-Fi network. b) See addNetworkSuggestions(java.util.List), removeNetworkSuggestions(java.util.List) for new API to add Wi-Fi networks for consideration when auto-connecting to wifi. Compatibility Note: For applications targeting android.os.Build.VERSION_CODES#Q or above, this API will always fail and return false.',
  )
  bool disconnect();
  @Deprecated(
    'a) See WifiNetworkSpecifier.Builder.build() for new mechanism to trigger connection to a Wi-Fi network. b) See addNetworkSuggestions(java.util.List), removeNetworkSuggestions(java.util.List) for new API to add Wi-Fi networks for consideration when auto-connecting to wifi. Compatibility Note: For applications targeting android.os.Build.VERSION_CODES#Q or above, this API will always fail and return false. Deprecation Exemptions:',
  )
  bool enableNetwork(int nedId, bool attemptConnect);
  // void flushPasspointAnqpCache();
  // List<WifiAvailableChannel> getAllowedChannels(int band, int mode);
  // List<WifiConfiguration> getCallerConfiguredNetworks();
  // void getChannelData(Consumer<List<Bundle>> resultsCallback);
  // int getMaxNumberOfChannelsPerNetworkSpecifierRequest();
  // int getMaxNumberOfNetworkSuggestionsPerApp();
  // int getMaxSignalLevel();
  // void getMaxSupportedConcurrentTdlsSessions(Consumer<int> resultsCallback);
  // List<WifiNetworkSuggestion> getNetworkSuggestions();
  // void getNumberOfEnabledTdlsSessions(Consumer<int> resultsCallback);
  // @Deprecated('This will be non-functional in a future release. Requires android.Manifest.permission.NETWORK_SETTINGS or android.Manifest.permission.NETWORK_SETUP_WIZARD.')
  // List<PasspointConfiguration> getPasspointConfigurations();
  // void getPerSsidRoamingModes(Consumer<Map<String, int>> resultsCallback);
  // int getStaConcurrencyForMultiInternetMode();
  // List<WifiAvailableChannel> getUsableChannels(int band, int mode);
  // bool is24GHzBandSupported();
  // bool is5GHzBandSupported();
  // bool is60GHzBandSupported();
  // bool is6GHzBandSupported();
  // bool isAggressiveRoamingModeSupported();
  // bool isAutoWakeupEnabled();
  // bool isBridgedApConcurrencySupported();
  // bool isCarrierNetworkOffloadEnabled();
  // bool isD2dSupportedWhenInfraStaDisabled();
  // bool isDecoratedIdentitySupported();
  // @Deprecated('Please use android.content.pm.PackageManager#hasSystemFeature(String) with android.content.pm.PackageManager#FEATURE_WIFI_RTT.')
  // bool isDeviceToApRttSupported();
  // bool isDualBandSimultaneousSupported();
  // bool isEasyConnectDppAkmSupported();
  // bool isEasyConnectEnrolleeResponderModeSupported();
  // bool isEasyConnectSupported();
  // bool isEnhancedOpenSupported();
  // bool isEnhancedPowerReportingSupported();
  // bool isMakeBeforeBreakWifiSwitchingSupported();
  // bool isP2pSupported();
  // bool isPasspointTermsAndConditionsSupported();
  // bool isPreferredNetworkOffloadSupported();
  // @Deprecated('The ability for apps to trigger scan requests will be removed in a future release.')
  // bool isScanAlwaysAvailable();
  // bool isScanThrottleEnabled();
  // bool isStaApConcurrencySupported();
  // bool isStaBridgedApConcurrencySupported();
  // bool isStaConcurrencyForLocalOnlyConnectionsSupported();
  // bool isStaConcurrencyForMultiInternetSupported();
  // void isTdlsOperationCurrentlyAvailable(Consumer<bool> resultsCallback);
  // bool isTdlsSupported();
  // bool isTidToLinkMappingNegotiationSupported();
  // bool isTlsMinimumVersionSupported();
  // bool isTlsV13Supported();
  // bool isTrustOnFirstUseSupported();
  // bool isWapiSupported();
  // bool isWepSupporeted();
  // bool isWifiDisplayR2Supporeted();
  // bool isWifiPasspointEnabled();
  // bool isWifiStandardSupported(int standard);
  // bool isWpa3SaeH2eSupported();
  // bool isWpa3SaePublicKeySupported();
  // bool isWpa3SaeSupported();
  // bool isWpa3SuiteBSupported();
  // bool isWpaPersonalSupported();
  // @Deprecated('Will return the output of isWifiEnabled() instead.')
  // bool pingSupplicant();
  // void queryAutojoinGlobal(Consumer<bool> resultsCallback);
  // void querySendDhcpHostnameRestriction(Consumer<int> resultsCallback);
  @Deprecated(
    'a) See WifiNetworkSpecifier.Builder.build() for new mechanism to trigger connection to a Wi-Fi network. b) See addNetworkSuggestions(java.util.List), removeNetworkSuggestions(java.util.List) for new API to add Wi-Fi networks for consideration when auto-connecting to wifi. Compatibility Note: For applications targeting android.os.Build.VERSION_CODES#Q or above, this API will always return false.',
  )
  bool reassociate();
  @Deprecated(
    'a) See WifiNetworkSpecifier.Builder.build() for new mechanism to trigger connection to a Wi-Fi network. b) See addNetworkSuggestions(java.util.List), removeNetworkSuggestions(java.util.List) for new API to add Wi-Fi networks for consideration when auto-connecting to wifi. Compatibility Note: For applications targeting android.os.Build.VERSION_CODES#Q or above, this API will always fail and return false.',
  )
  bool reconnect();
  void registerScanResultsCallback(WifiManager$ScanResultsCallback callback);
  // void registerSubsystemRestartTrackingCallback(
  //   WifiManagerSubsystemRestartTrackingCallback callback,
  // );
  // void removeLocalOnlyConnectionFailureListener(
  //   WifiManagerLocalOnlyConnectionFailureListener listener,
  // );
  @Deprecated(
    'a) See WifiNetworkSpecifier.Builder.build() for new mechanism to trigger connection to a Wi-Fi network. b) See addNetworkSuggestions(java.util.List), removeNetworkSuggestions(java.util.List) for new API to add Wi-Fi networks for consideration when auto-connecting to wifi. Compatibility Note: For applications targeting android.os.Build.VERSION_CODES#Q or above, this API will always fail and return false.',
  )
  bool removeNetwork(int netId);
  // int removeNetworkSuggestions(List<WifiNetworkSuggestion> networkSuggestions);
  // int removeNetworkSuggestions(
  //   List<wifiNetworkSuggestion> networkSuggestions,
  //   int action,
  // );
  bool removeNonCallerConfiguredNetworks();
  // @Deprecated('This will be non-functional in a future release. Requires android.Manifest.permission.NETWORK_SETTINGS or android.Manifest.permission.NETWORK_CARRIER_PROVISIONING.')
  // void removePasspointConfiguration(String fqdn);
  // void removePerSsidRoamingMode(WifiSsid ssid);
  // void removeSuggestionConnectionStatusListener(
  //   WifiManagerSuggestionConnectionStatusListener listener,
  // );
  // void removeSuggestionUserApprovalStatusListener(
  //   WifiManagerSuggestionUserApprovalStatusListener listener,
  // );
  void removeWifiStateChangedListener(
    WifiManager$WifiStateChangedListener listener,
  );
  // void reportCreateInterfaceImpact(
  //   int interfaceType,
  //   Consumer<(bool, Set<WifiManagerInterfaceCreationImpact>)> resultCallback,
  // );
  @Deprecated(
    'There is no need to call this method - addNetwork(android.net.wifi.WifiConfiguration), updateNetwork(android.net.wifi.WifiConfiguration) and removeNetwork(int) already persist the configurations automatically.',
  )
  bool saveConfiguration();
  // void setPerSsidRoamingMode(WifiSsid ssid, int roamingMode);
  // void setSendDhcpHostnameRestriction(int restriction);
  // void setTdlsEnabled(InetAddress remoteIPAddress, bool enable);
  // void setTdlsEnabled(
  //   InetAddress remoteIPAddress,
  //   bool enable,
  //   Consumer<bool> resultsCallback,
  // );
  // void setTdlsEnabledWithMacAddress(String remoteMacAddress, bool enable);
  // void setTdlsEnabledWithMacAddress(
  //   String remoteMacAddress,
  //   bool enable,
  //   Consumer<bool> resultsCallback,
  // );
  @Deprecated(
    'Starting with Build.VERSION_CODES#Q, applications are not allowed to enable/disable Wi-Fi. Compatibility Note: For applications targeting android.os.Build.VERSION_CODES#Q or above, this API will always fail and return false. If apps are targeting an older SDK (android.os.Build.VERSION_CODES#P or below), they can continue to use this API.',
  )
  bool setWifiEnabled(bool enabled);
  // void startLocalOnlyHotspot(WifiManagerLocalOnlyHotspotCallback callback);
  // void startLocalOnlyHotspotWithConfiguration(
  //   SoftApConfiguration config,
  //   WifiManagerLocalHotspotCallback callback,
  // );
  @Deprecated(
    'The ability for apps to trigger scan requests will be removed in a future release.',
  )
  bool startScan();
  // @Deprecated('This API is deprecated')
  // void startWps(WpsInfo config, WifiManagerWpsCallback listener);
  void unregisterScanResultsCallback(WifiManager$ScanResultsCallback callback);
  // void unregisterSubsystemRestartTrackingCallback(
  //   WifiManagerSubsystemRestartTrackingCallback callback,
  // );
  @Deprecated(
    'a) See WifiNetworkSpecifier.Builder.build() for new mechanism to trigger connection to a Wi-Fi network. b) See addNetworkSuggestions(java.util.List), removeNetworkSuggestions(java.util.List) for new API to add Wi-Fi networks for consideration when auto-connecting to wifi. Compatibility Note: For applications targeting android.os.Build.VERSION_CODES#Q or above, this API will always fail and return -1.',
  )
  int updateNetwork(WifiConfiguration config);
  // bool validateSoftApConfiguration(SoftApConfiguration config);
}
