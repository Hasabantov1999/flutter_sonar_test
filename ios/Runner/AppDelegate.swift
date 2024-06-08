import UIKit
import Flutter
import GoogleMaps
// import Firebase
@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // FirebaseApp.configure()
    GMSServices.provideAPIKey("AIzaSyAsZfl6Ptbdw9dJz65rO_1YhO0P2dVLBRE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
