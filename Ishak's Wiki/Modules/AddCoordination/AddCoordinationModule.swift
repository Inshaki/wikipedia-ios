
import UIKit
protocol CoordinatorDelegate: class {
    func didFinishWithSuccess()
}

class AddCoordinationModule {
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Coordination", bundle: Bundle.main)
    }

    static func buildDefault(delegate: CoordinatorDelegate) -> UIViewController {
        let repo = AppAssembly.shared.repository
        
        let presenter: (AddCoordinationPresenter & AddCoordinationInteractorOutput) = AddCoordinationPresenterImpl()

        let interactor = AddCoordinationInteractorImpl(interactorOutput: presenter, coordinatesRepo: repo)
        let router = AddCoordinationRouterImpl(delegate: delegate)
        presenter.interactor = interactor

        guard let view = storyboard.instantiateViewController(identifier: "AddCoordinationViewController") as? AddCoordinationViewController else { fatalError("Invalid View Controller") }
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.view = view

        return UINavigationController(rootViewController: view) //UINavigationController(rootViewController: view)
    }

}
