


import UIKit

@MainActor
class LifeFormViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    var itemId: Int?
    var itemName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = itemName
        
        if let id = itemId {
            Task {
                do {
                    let imageUrl = try await getItem(id: id)
                    if let url = URL(string: imageUrl) {
                        let imageData = try Data(contentsOf: url)
                        imageView.image = UIImage(data: imageData)
                    }
                } catch {
                    print(id)
                    print("Error fetching image URL: \(error)")
                }
            }
        }
    }
}
