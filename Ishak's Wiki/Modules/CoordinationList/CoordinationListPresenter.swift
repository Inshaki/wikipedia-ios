//~~~**DELETE THIS HEADER**~~~

import UIKit
class CoordinationListPresenterImpl {
    weak var view: CoordinationListView?
    var interactor: CoordinationListInteractor?
    var router: CoordinationRouter?
    
    var coordinations: [CoordinationModel] = []
    
    private func mapCoordinationToCellData(dataModel: CoordinationModel) -> CoordinationCellData {
        let locationString = "lat: \(dataModel.latitude), lon: \(dataModel.longitude)"
        return CoordinationCellData(name: dataModel.title, location: locationString)
    }
}

extension CoordinationListPresenterImpl: CoordinationListPresenter {
    
    func viewDidLoad() {
        interactor?.fetchLocations(withRefresh: true)
    }
    
    func getTableData<T>(row: Int, section: Int) -> T? {
        guard let coordination = coordinations[safe: row] else { return nil }
        return mapCoordinationToCellData(dataModel: coordination) as? T
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return coordinations.count
    }
    
    func addNewCoordination() {
        router?.openNewCoordinationScreen(delegate: self)
    }
    
    func didSelectRow(row: Int, section: Int) {
        guard let coordination = coordinations[safe: row] else { return }
        
        router?.openWikiWithLocation(latitude: coordination.latitude, longitude: coordination.longitude)
        print(coordination.title)
    }
}

extension CoordinationListPresenterImpl: CoordinationListInteractorOutput {
    func coordinatorsReceived(coordinates: [CoordinationModel]) {
        self.coordinations = coordinates
        view?.reloadScreen()
    }
}

extension CoordinationListPresenterImpl: CoordinatorDelegate {
    func didFinishWithSuccess() {
        interactor?.fetchLocations(withRefresh: false)
    }
}

struct CoordinationCellData: DefaultCellData {
    func getIdentifier() -> String {
        return "CoordinationTableViewCell"
    }
    
    let name: String
    let location: String
}
