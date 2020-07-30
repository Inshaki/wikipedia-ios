import Foundation
import UIKit
protocol AppAssemblyProtocol {
    var repository: CoordinationRepoProtocol { get }
    var application: UIApplication { get }
}

struct AppAssembly {
    
    static var shared: AppAssemblyProtocol {
        return _services
    }
    
    static func setup(application: UIApplication) {
        _services = IshaksWiki(application: application)
    }
    
    static fileprivate var _services: AppAssemblyProtocol!
}

class IshaksWiki: AppAssemblyProtocol {
    
    let application: UIApplication
    let repository: CoordinationRepoProtocol
    
    init(application: UIApplication) {
        self.application = application
        self.repository = CoordinationRepo()
    }
}
