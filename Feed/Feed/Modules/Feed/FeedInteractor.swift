import UIKit
import Firebase

class FeedInteractor: FeedInteracting {
    
    weak var delegate: FeedInteractorDelegate?
    
    // MARK: Business logic

    func fetchPosts() {
        
        let postReference = Database.database().reference(withPath: "post")
        postReference.observe(.value, with: { [weak self] snapshot in
            
            var posts: [Post] = []
            
            for item in snapshot.children {
                guard
                    let snapshot = item as? DataSnapshot,
                    let dictionary = snapshot.value as? Dictionary<String, Any> else { return }
                posts.append(Post(dictionary: dictionary))
            }
            
            self?.delegate?.fetchedPosts(posts)
        })
    }
}
