import UIKit

class FeedRouter: FeedRouting {
    weak var viewController: UIViewController?
    
    static func makeModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "FeedViewController") as? FeedViewController else {
            fatalError()
        }
        
        let router = FeedRouter()
        let interactor = FeedInteractor()
        let presenter = FeedPresenter(interactor: interactor, router: router)
        
        router.viewController = viewController
        viewController.presenter = presenter
        presenter.delegate = viewController
        interactor.delegate = presenter
        
        return viewController
    }
}
