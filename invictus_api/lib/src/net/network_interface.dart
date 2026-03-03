import 'dart:typed_data';

import 'package:invictus_api/src/net.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// This class represents a Network Interface made up of a name, and a list of IP addresses assigned to this interface. It is
/// used to identify the local interface on which a multicast group is joined. Interfaces are normally known by names such
/// as "le0".
///
/// Note that information about NetworkInterfaces may be restricted. For example, non-system apps will only have
/// access to information about NetworkInterfaces that are associated with an InetAddress.
abstract interface class NetworkInterface {
  /// Returns all the interfaces on this machine. The Enumeration contains at least one element, possibly representing a
  /// loopback interface that only supports communication between entities on this machine. NOTE: can use
  /// getNetworkInterfaces()+getInetAddresses() to obtain all IP addresses for this node
  ///
  /// For non-system apps, this method will only return information for NetworkInterfaces associated with an InetAddress.
  ///
  /// ANDROID NOTE: On Android versions before S (API level 31), this method may throw a NullPointerException if called in
  /// an environment where there is a virtual interface without a parent interface present.
  ///
  /// returns an Enumeration of NetworkInterfaces found on this machine that are accessible.
  ///
  /// throws SocketException if an I/O error occurs.
  static List<NetworkInterface> getNetworkInterfaces() =>
      NetworkInterfaceChannel.instance.getNetworkInterfaces();

  /// Get a network interface given its index.
  ///
  /// [index] an integer, the index of the interface
  ///
  /// returns the NetworkInterface obtained from its index, or null if an interface with the specified index
  /// does not exist or can't be accessed.
  ///
  /// throws SocketException if an I/O error occurs.
  ///
  /// throws IllegalArgumentException if index has a negative value
  static NetworkInterface? getByIndex(int index) =>
      NetworkInterfaceChannel.instance.getByIndex(index);

  /// Convenience method to search for a network interface that has the specified Internet Protocol (IP) address bound to
  /// it.
  ///
  /// If the specified IP address is bound to multiple network interfaces it is not defined which network interface is returned.
  ///
  /// [addr] The InetAddress to search with.
  ///
  /// returns a NetworkInterface or null if there is no network interface with the specified IP address.
  ///
  /// throws SocketException if an I/O error occurs.
  ///
  /// throws NullPointerException if the specified address is null.
  static NetworkInterface? getByInetAddress(InetAddress addr) =>
      NetworkInterfaceChannel.instance.getByInetAddress(addr);

  /// Searches for the network interface with the specified name.
  ///
  /// [name] The name of the network interface.
  ///
  /// returns a NetworkInterface with the specified name, or null if the network interface with the
  /// specified name does not exist or can't be accessed.
  ///
  /// throws SocketException if an I/O error occurs.
  ///
  /// throws NullPointerException if the specified name is null.
  static NetworkInterface? getByName(String name) =>
      NetworkInterfaceChannel.instance.getByName(name);

  /// Get the display name of this network interface. A display name is a human readable String describing the network
  /// device.
  String get displayName;

  /// Returns the hardware address (usually MAC) of the interface if it has one and if it can be accessed given the current
  /// privileges. If a security manager is set, then the caller must have the permission
  /// NetPermission("getNetworkInformation").
  ///
  /// throws SocketException if an I/O error occurs.
  Uint8List? get hardwareAddress;

  /// Returns the index of this network interface. The index is an integer greater or equal to zero, or -1 for unknown. This is
  /// a system specific value and interfaces with the same name can have different indexes on different machines.
  int get index;

  /// Convenience method to return an Enumeration with all or a subset of the InetAddresses bound to this network
  /// interface.
  ///
  /// If there is a security manager, its checkConnect method is called for each InetAddress. Only InetAddresses where
  /// the checkConnect doesn't throw a SecurityException will be returned in the Enumeration. However, if the caller has
  /// the NetPermission("getNetworkInformation") permission, then all InetAddresses are returned.
  List<InetAddress> get inetAddresses;

  /// Get a List of all or a subset of the InterfaceAddresses of this network interface.
  ///
  /// If there is a security manager, its checkConnect method is called with the InetAddress for each InterfaceAddress.
  /// Only InterfaceAddresses where the checkConnect doesn't throw a SecurityException will be returned in the List.
  List<InterfaceAddress> get interfaceAddresses;

  /// Returns the Maximum Transmission Unit (MTU) of this interface.
  int get mtu;

  /// Get the name of this network interface.
  String get name;

  /// Returns the parent NetworkInterface of this interface if this is a subinterface, or null if it is a physical (non virtual)
  /// interface or has no parent.
  NetworkInterface? get parent;

  /// Get an Enumeration with all the subinterfaces (also known as virtual interfaces) attached to this network interface.
  ///
  /// For instance eth0:1 will be a subinterface to eth0.
  List<NetworkInterface> get subInterfaces;

  /// Returns whether a network interface is a loopback interface.
  ///
  /// throws SocketException if an I/O error occurs.
  bool get isLoopback;

  /// Returns whether a network interface is a point to point interface. A typical point to point interface would be a PPP
  /// connection through a modem.
  ///
  /// throws SocketException if an I/O error occurs.
  bool get isPointToPoint;

  /// Returns whether a network interface is up and running.
  ///
  /// throws SocketException if an I/O error occurs.
  bool get isUp;

  /// Returns whether this interface is a virtual interface (also called subinterface). Virtual interfaces are, on some systems,
  /// interfaces created as a child of a physical interface and given different settings (like address or MTU). Usually the
  /// name of the interface will the name of the parent followed by a colon (:) and a number identifying the child since there
  /// can be several virtual interfaces attached to a single physical interface.
  bool get isVirtual;

  /// Returns whether a network interface supports multicasting or not.
  ///
  /// throws SocketException if an I/O error occurs.
  bool get supportsMulticast;
}

abstract base class NetworkInterfaceChannel extends PlatformInterface {
  /// Constructs a [NetworkInterfaceChannel].
  NetworkInterfaceChannel() : super(token: _token);

  static final Object _token = Object();

  static NetworkInterfaceChannel? _instance;

  /// The default instance of [NetworkInterfaceChannel] to use.
  static NetworkInterfaceChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NetworkInterfaceChannel] when
  /// they register themselves.
  static set instance(NetworkInterfaceChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  NetworkInterface? getByIndex(int index);
  NetworkInterface? getByInetAddress(InetAddress addr);
  NetworkInterface? getByName(String name);
  List<NetworkInterface> getNetworkInterfaces();
}
