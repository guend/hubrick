import UIKit

protocol FeedPresenting: class {
    weak var delegate: FeedPresenterDelegate? { get set }
    
    init(interactor: FeedInteracting,
         router: FeedRouting)
}

protocol FeedPresenterDelegate: class {

}

protocol FeedInteracting: class {
    weak var delegate: FeedInteractorDelegate? { get set }
}

protocol FeedInteractorDelegate: class {
}

protocol FeedRouting: class {
    weak var viewController: UIViewController? { get set }
    static func makeModule() -> UIViewController
}
