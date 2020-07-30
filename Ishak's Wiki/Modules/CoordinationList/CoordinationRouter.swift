import UIKit
class CoordinationRouterImpl {
    weak var view: CoordinationListView?
    weak var app: UIApplication?
    
    init(app: UIApplication) {
        self.app = app
    }
}
extension CoordinationRouterImpl: CoordinationRouter {
    func openNewCoordinationScreen(delegate: CoordinatorDelegate) {
        let vc = AddCoordinationModule.buildDefault(delegate: delegate)
        (view as? UIViewController)?.present(vc, animated: true, completion: nil)
    }

    func openWikiWithLocation(latitude: Double, longitude: Double) {
        let appURLScheme = "wikipedia://places/q?lat=\(latitude)&lon=\(longitude)"

         guard let app = app, let appURL = URL(string: appURLScheme) else {
             return
         }

        if app.canOpenURL(appURL) {

             if #available(iOS 10.0, *) {
                 app.open(appURL)
             }
             else {
                 app.openURL(appURL)
             }
         }
    }
    
}

