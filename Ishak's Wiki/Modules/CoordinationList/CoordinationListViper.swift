
import Foundation
protocol CoordinationListView: class {
    var presenter: CoordinationListPresenter? { get set }
    func reloadScreen()
}

protocol CoordinationListPresenter: TablePresenter {
    var view: CoordinationListView? { get set }
    var router: CoordinationRouter? { get set }
    func addNewCoordination()
    func refreshDetail()
}

protocol CoordinationListInteractorOutput: class {
    var interactor: CoordinationListInteractor? { get set }
    func coordinatorsReceived(coordinates: [CoordinationModel])
}

protocol CoordinationListInteractor: class {
    var interactorOutput: CoordinationListInteractorOutput? { get set }
    func fetchLocations(withRefresh: Bool)
}

protocol CoordinationRouter: class {
    var view: CoordinationListView? { get set }
    func openNewCoordinationScreen(delegate: CoordinatorDelegate)
    func openWikiWithLocation(latitude: Double, longitude: Double)
}
