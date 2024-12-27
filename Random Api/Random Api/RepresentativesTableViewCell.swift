import UIKit

class RepresentativesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    var name: String? {
        didSet {
            setNeedsUpdateConfiguration()
        }
    }
    
    var location: String? {
        didSet {
            setNeedsUpdateConfiguration()
        }
    }
    
    var website: String? {
        didSet {
            setNeedsUpdateConfiguration()
        }
    }
    
    
    override func updateConfiguration(using state: UICellConfigurationState) {

        nameLabel.text = name
        locationLabel.text = location
        websiteLabel.text = website
    }
}
