import CoreFoundation
class CoordinationListInteractorImpl {
    weak var coordinatesRepo: CoordinationRepoProtocol?
    weak var interactorOutput: CoordinationListInteractorOutput?

    init(interactorOutput: CoordinationListInteractorOutput, coordinatesRepo: CoordinationRepoProtocol) {
        self.interactorOutput = interactorOutput
        self.coordinatesRepo = coordinatesRepo
    }
}
extension CoordinationListInteractorImpl: CoordinationListInteractor {
    func fetchLocations(withRefresh: Bool) {
        coordinatesRepo?.fetchLocations(refresh: withRefresh, completion: { [weak self] (coordinations) in
            self?.interactorOutput?.coordinatorsReceived(coordinates: coordinations)
        })
    }
}


