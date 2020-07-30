//~~~**DELETE THIS HEADER**~~~

import Foundation
class AddCoordinationInteractorImpl {
    weak var interactorOutput: AddCoordinationInteractorOutput?
    weak var coordinatesRepo: CoordinationRepoProtocol?

    init(interactorOutput: AddCoordinationInteractorOutput, coordinatesRepo: CoordinationRepoProtocol) {
        self.interactorOutput = interactorOutput
        self.coordinatesRepo = coordinatesRepo
    }

}

extension AddCoordinationInteractorImpl: AddCoordinationInteractor {
    func isValidLat(lat: Double) -> Bool {
        return lat > -90 && lat < 90
    }
    
    func isValidLon(lon: Double) -> Bool {
        return lon > -180 && lon < 180
    }
    
    func addNewLocation(location: CoordinationModel) {
        coordinatesRepo?.addLocation(location: location)
    }
    
    func isValidName(name: String) -> Bool {
        return name.count > 1
    }
}
