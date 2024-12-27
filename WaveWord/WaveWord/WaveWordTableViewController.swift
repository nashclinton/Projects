



import UIKit

class WaveWordTableViewController: UITableViewController {
    
    var controller = PostController.shared
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        print("doing something")
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Post Cell", for: indexPath) as! WaveWordTableViewCell
        let post = controller.posts[indexPath.row]
        cell.update(with: post)
        return cell
    }
}
