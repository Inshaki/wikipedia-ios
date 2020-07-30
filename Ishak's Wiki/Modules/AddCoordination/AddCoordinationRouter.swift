
//~~~**DELETE THIS HEADER**~~~

import UIKit
class AddCoordinationRouterImpl {
    weak var view: AddCoordinationView?
    weak var delegate: CoordinatorDelegate?
    init(delegate: CoordinatorDelegate) {
        self.delegate = delegate
    }
}
extension AddCoordinationRouterImpl: AddCoordinationRouter {
    func addCoordinationFinished() {
        delegate?.didFinishWithSuccess()
        (view as? UIViewController)?.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func addCoordinationCanceled() {
        (view as? UIViewController)?.navigationController?.dismiss(animated: true, completion: nil)
    }

}

