import UIKit

extension UIView {
    /// Our version of recursiveDescription that prints out a views heirarchy
    func recursiveDescription() -> String {
        return recursiveDescriptionHelper(with: "")
    }
    
    /// Private helper to handle formatting of the heirarchy output
    private func recursiveDescriptionHelper(with prefix: String) -> String {
        guard !subviews.isEmpty else {
            return description
        }
        
        var text: String = description
        let nextPrefix: String = prefix + "|"
        for view in subviews {
            text.append("\n")
            text.append(nextPrefix)
            text.append(view.recursiveDescriptionHelper(with: nextPrefix))
        }
        
        return text
    }
}

// MARK: Example
let scrollView = UIScrollView()
let label1 = UILabel()
let label2 = UILabel()
scrollView.addSubview(label1)
scrollView.addSubview(label2)

let tableView = UITableView()
let imageView = UIImageView()
tableView.addSubview(imageView)

let view = UIView()
view.addSubview(scrollView)
view.addSubview(tableView)

print(view.recursiveDescription())
