import UIKit
import Kingfisher

class FeedViewController: UIViewController {
    
    // MARK: - Constants
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    
    var presenter: FeedPresenting?
    var posts: [PostViewModel] = []
    
    // MARK: - Init
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    // MARK: - Private
    
    private func setupTableView() {
        tableView.register(FeedCell.self)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 1000
        tableView.dataSource = self
    }
}

extension FeedViewController: FeedPresenterViewing {
    func showPosts(_ posts: [PostViewModel]) {
        self.posts = posts
        tableView.reloadData()
    }
}

extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as FeedCell
        let post = posts[indexPath.row]
        
        cell.avatarImageView.kf.setImage(with: post.authorImageUrl)
        cell.feedImageView.kf.setImage(with: post.imageUrl)
        cell.avatarNameLabel.text = post.displayName
        cell.timeLabel.text = post.time
        cell.titleLabel.text = post.title
        cell.descriptionLabel.text = post.description
        cell.numberOfLikesLabel.text = post.likesCount
        cell.numberOfCommentsLabel.text = post.commentsCount
        cell.numberOfSharingsLabel.text = post.shareCount
        
        return cell
    }
}
