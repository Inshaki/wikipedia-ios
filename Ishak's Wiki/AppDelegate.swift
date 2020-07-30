//~~~**DELETE THIS HEADER**~~~

import UIKit

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppAssembly.setup(application: application)
        return true
    }
}
