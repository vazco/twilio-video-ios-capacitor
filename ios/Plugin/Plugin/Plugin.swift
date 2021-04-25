import Foundation
import Capacitor
import Photos

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(TwilioVideoIosCapacitor)
public class TwilioVideoIosCapacitor: CAPPlugin {
    
    open var viewCont: UIViewController?;
    
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
            self.bridge.viewController.present(viewController, animated: true, completion: nil)
        
        }
        
        call.resolve()
    }
    
    @objc public func disconnect(_ call: CAPPluginCall) {
        DispatchQueue.main.sync {
            self.bridge.viewController.dismiss(animated: true, completion: nil);
        }
        call.resolve()
    }


}
