#if os(iOS)
import Flutter
import UIKit
#elseif os(macOS)
import Cocoa
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

public class InvictusDarwinPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = InvictusDarwinPlugin(with: registrar)
        registrar.publish(instance)
    }
    
    init(with registrar: FlutterPluginRegistrar) {}
    
    public func detachFromEngine(for registrar: any FlutterPluginRegistrar) {}
}

#if os(iOS)
extension FlutterPluginRegistrar {
    var messenger: FlutterBinaryMessenger { return self.messenger() }
}
#endif
