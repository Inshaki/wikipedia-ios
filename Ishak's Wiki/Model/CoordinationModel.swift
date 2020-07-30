
import UIKit
import CoreLocation
struct CoordinationModel {
    let title: String
    let latitude: Double
    let longitude: Double
    
    func getLocation() -> CLLocation? {
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}
