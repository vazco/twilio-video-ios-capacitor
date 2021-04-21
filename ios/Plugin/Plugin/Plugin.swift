import Foundation
import Capacitor
import Photos

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(TwilioVideoIosCapacitor)
public class TwilioVideoIosCapacitor: CAPPlugin {
    
    @objc func joinRoom(_ call: CAPPluginCall) {
        
        guard let roomName = call.options["roomName"] as? String else {
            call.reject("Must provide an roomName")
            return
        }
        
        guard let accessToken = call.options["accessToken"] as? String else {
            call.reject("Must provide an accessToken")
            return
        }
        let podBundle = Bundle(for: TwilioVideoViewController.self)
        
        let bundleURL = podBundle.url(forResource: "TwilioVideoIosCapacitor", withExtension: "bundle")!
        let bundle = Bundle(url: bundleURL)!

        DispatchQueue.main.sync {
            let viewController = TwilioVideoViewController(nibName: "TwilioVideoViewController", bundle: bundle)
            viewController.roomName = roomName
            viewController.accessToken = accessToken
//            viewController.bridge = self.bridge

            self.bridge.viewController.present(viewController, animated: true, completion: nil)
        
        }
        
        call.resolve()
    }
    
    @objc public func triggerWindowJSEvent(eventName: String) {
        self.bridge.triggerJSEvent(eventName: eventName, target: "window")
    }

    @objc public func triggerWindowJSEvent(eventName: String, data: String) {
        self.bridge.triggerJSEvent(eventName: eventName, target: "window", data: data)
    }

}
