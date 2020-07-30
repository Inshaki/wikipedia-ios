//~~~**DELETE THIS HEADER**~~~

import Foundation
protocol CoordinationRepoProtocol: class {
    func addLocation(location: CoordinationModel)
    func fetchLocations(refresh: Bool, completion: @escaping (([CoordinationModel]) -> Void))

}
class CoordinationRepo: CoordinationRepoProtocol {
    var cachedLocations: [CoordinationModel] = []

    func addLocation(location: CoordinationModel) {
        if cachedLocations.contains(where: {$0.title == location.title }) {
            return
        }
        cachedLocations.insert(location, at: 0)
    }
    
    func fetchLocations(refresh: Bool, completion: @escaping (([CoordinationModel]) -> Void)) {
        if refresh || cachedLocations.isEmpty {
            cachedLocations = [amsterdam, istanbul, rio]
        }
        completion(cachedLocations)
    }
}

fileprivate let amsterdam = CoordinationModel(title: "Amsterdam", latitude: 52.379189, longitude: 4.899431)
fileprivate let istanbul = CoordinationModel(title: "Istanbul", latitude: 41.015137, longitude: 28.979530)
fileprivate let rio = CoordinationModel(title: "Rio de Janeiro", latitude: -22.908333, longitude: -43.196388)
