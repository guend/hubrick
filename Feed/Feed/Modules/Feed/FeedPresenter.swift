import UIKit

class FeedPresenter: FeedPresenting {
    
    // MARK: - Variables
    
    weak var delegate: FeedPresenterDelegate?
    private let router: FeedRouting
    private let interactor: FeedInteracting
    
    // MARK: - Init
    
    required init(interactor: FeedInteracting, router: FeedRouting) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Public
    
    // MARK: - Private Methods
    
}

extension FeedPresenter: FeedInteractorDelegate {

}
