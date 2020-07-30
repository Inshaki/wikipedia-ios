import UIKit

class CoordinationModule {
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Coordination", bundle: Bundle.main)
    }

    static func buildDefault() -> UIViewController {
        let repo = AppAssembly.shared.repository
        let app = AppAssembly.shared.application
        
        let presenter: (CoordinationListPresenter & CoordinationListInteractorOutput) = CoordinationListPresenterImpl()

        let interactor = CoordinationListInteractorImpl(interactorOutput: presenter, coordinatesRepo: repo)
        let router = CoordinationRouterImpl(app: app)
        presenter.interactor = interactor

        guard let view = storyboard.instantiateInitialViewController() as? CoordinationListViewController else { fatalError("Invalid View Controller") }
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.view = view
        return UINavigationController(rootViewController: view) //UINavigationController(rootViewController: view)
    }
}
