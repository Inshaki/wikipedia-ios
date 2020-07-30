//~~~**DELETE THIS HEADER**~~~

import Foundation
class AddCoordinationPresenterImpl {
    weak var view: AddCoordinationView?
    var interactor: AddCoordinationInteractor?
    var router: AddCoordinationRouter?
}
extension AddCoordinationPresenterImpl: AddCoordinationPresenter {
    
    func onSavePressed(name nameOpt: String?, lat latOpt: String?, lon lonOpt: String?) {
        guard let lat = latOpt, let lon = lonOpt, let title = nameOpt, let latitude = Double(lat), let longitude = Double(lon) else { return }
        
        guard let interactor = interactor, interactor.isValidName(name: title), interactor.isValidLon(lon: longitude), interactor.isValidLat(lat: latitude) else { return }
        
        let coordinationModel = CoordinationModel(title: title, latitude: latitude, longitude: longitude)
        view?.onSuccessScreen()
        interactor.addNewLocation(location: coordinationModel)
        delayWithSeconds(1) { [weak self] in
            self?.router?.addCoordinationFinished()
        }
    }
    
    func onCancelPressed() {
        router?.addCoordinationCanceled()
    }
 
    func onLatChanged(lat: String?) {
        guard let latString = lat, let latValue = Double(latString) else {
            view?.latitudeValidation(hasSucces: false)
            return
        }
        
        let isValid = interactor?.isValidLat(lat: latValue) ?? false
        view?.latitudeValidation(hasSucces: isValid)
    }
    
    func onLonChanged(lon: String?) {
        guard let lonString = lon, let lonValue = Double(lonString) else {
            view?.longitudeValidation(hasSucces: false)
            return
        }
        
        let isValid = interactor?.isValidLon(lon: lonValue) ?? false
        view?.longitudeValidation(hasSucces: isValid)

    }
    
    func onNameChanged(name: String?) {
        guard let nameValue = name, let isValid = interactor?.isValidName(name: nameValue) else {
            view?.nameValidation(hasSucces: false)
            return
        }
        view?.nameValidation(hasSucces: isValid)
    }

}

extension AddCoordinationPresenterImpl: AddCoordinationInteractorOutput {

}
