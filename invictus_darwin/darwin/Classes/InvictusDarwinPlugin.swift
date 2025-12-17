import Flutter
import UIKit

public class InvictusDarwinPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = InvictusDarwinPlugin()
        registrar.publish(instance)
    }
    
    public func detachFromEngine(for registrar: any FlutterPluginRegistrar) {}
}
