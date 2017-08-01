import UIKit

protocol FeedPresenting: class {
    weak var view: FeedPresenterViewing? { get set }
    
    func viewDidLoad()
}

protocol FeedPresenterViewing: class {
    func showPosts(_ posts: [PostViewModel])
}

protocol FeedInteracting: class {
    weak var delegate: FeedInteractorDelegate? { get set }
    
    func fetchPosts()
}

protocol FeedInteractorDelegate: class {
    func fetchedPosts(_ posts: [Post])
}

protocol FeedRouting: class {
    weak var viewController: UIViewController? { get set }
    static func makeModule() -> UIViewController
}
