import UIKit

class FeedPresenter: FeedPresenting {
    
    // MARK: - Variables
    
    weak var view: FeedPresenterViewing?
    private let router: FeedRouting
    private let interactor: FeedInteracting
    
    // MARK: - Init
    
    required init(interactor: FeedInteracting, router: FeedRouting) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Public
    
    func viewDidLoad() {
        interactor.fetchPosts()
    }
    
    // MARK: - Private Methods
    
    fileprivate func toPostViewModel(_ post: Post) -> PostViewModel {
        return PostViewModel(
            authorImageUrl: post.author.avatarImageUrl,
            displayName: post.author.displayName,
            time: "6 hours ago",
            imageUrl: post.payload.headlineImageUrl,
            title: post.payload.plainTitle,
            description: post.payload.plainContentPreview,
            likesCount: String(post.payload.stats.reactionStats.likesCount),
            commentsCount: String(post.payload.stats.commentsCount),
            shareCount: String(post.payload.stats.reactionStats.shareCount))
    }
}

extension FeedPresenter: FeedInteractorDelegate {
    func fetchedPosts(_ posts: [Post]) {
        view?.showPosts(posts.map(toPostViewModel))
    }
}
