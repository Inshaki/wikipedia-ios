//~~~**DELETE THIS HEADER**~~~

import Foundation
protocol AddCoordinationView: class {
    var presenter: AddCoordinationPresenter? { get set }
    func onSuccessScreen()
    func latitudeValidation(hasSucces: Bool)
    func nameValidation(hasSucces: Bool)
    func longitudeValidation(hasSucces: Bool)
}

protocol AddCoordinationPresenter: PresenterBase {
    var view: AddCoordinationView? { get set }
    var router: AddCoordinationRouter? { get set }
//    func addNewCoordination()
    func onSavePressed(name nameOpt: String?, lat latOpt: String?, lon lonOpt: String?) 
    func onCancelPressed()
    func onLatChanged(lat: String?)
    func onLonChanged(lon: String?)
    func onNameChanged(name: String?)
}

protocol AddCoordinationInteractor {
    var interactorOutput: AddCoordinationInteractorOutput? { get set }
    var coordinatesRepo: CoordinationRepoProtocol? { get set }
    func addNewLocation(location: CoordinationModel)
    func isValidLat(lat: Double) -> Bool
    func isValidLon(lon: Double) -> Bool
    func isValidName(name: String) -> Bool
}


protocol AddCoordinationInteractorOutput: class {
    var interactor: AddCoordinationInteractor? { get set }
}


protocol AddCoordinationRouter: class {
    var view: AddCoordinationView? { get set }
    func addCoordinationFinished()
    func addCoordinationCanceled()
}
