
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var descriptLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pictureImage: UIImageView!
    
    var controller = FamilyController.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptLabel.text = controller.selectedFamilyMember?.description
        nameLabel.text = controller.selectedFamilyMember?.name
        print(controller.selectedFamilyMember?.filename)
        pictureImage.image = UIImage(named: "\(controller.selectedFamilyMember?.filename ?? "Me")")
    }
    
}
