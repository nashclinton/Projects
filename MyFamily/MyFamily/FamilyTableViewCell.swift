//
//  FamilyTableViewCell.swift
//  MyFamily
//
//  Created by Nash Clinton on 10/31/24.
//

import UIKit



class FamilyTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    
    var familyMember: FamilyMembers?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }


    func update(with family: FamilyMembers) {
        familyMember = family
        nameLabel.text = family.name
        if let image = UIImage(named: family.filename) {
            imageView?.image = image
        } else {
            imageView?.image = UIImage(named: "me")
        }
    }
}
