//  https://realm.io/news/appbuilders-natasha-muraschev-practical-protocol-oriented-programming/

import Foundation
import UIKit

extension UITableView {
  
  func register<T: UITableViewCell>(_: T.Type) {
    let cellNib = UINib(nibName: T.reuseIdentifier, bundle: nil)
    register(cellNib, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    return cell
  }
}
