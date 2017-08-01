import UIKit
import Firebase

class FeedInteractor: FeedInteracting {
    
    weak var delegate: FeedInteractorDelegate?
    private let service: PostService
    
    // MARK: - Init
    
    init(service: PostService = PostService()) {
        self.service = service
    }
    
    // MARK: - Business logic

    func fetchPosts() {
        guard let delegate = delegate else { return }
        service.posts(completion: delegate.fetchedPosts)
    }
}
