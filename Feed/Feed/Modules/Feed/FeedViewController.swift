import UIKit

class FeedViewController: UIViewController {
    
    // MARK: - Constants
    
    // MARK: - IBOutlets
    
    // MARK: - Variables
    
    var presenter: FeedPresenting?
    
    // MARK: - Init
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    // MARK: - Private
    
}

extension FeedViewController: FeedPresenterDelegate {
    
}
