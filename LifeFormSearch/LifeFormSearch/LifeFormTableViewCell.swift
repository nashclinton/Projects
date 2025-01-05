//
//  LifeFormTableViewCell.swift
//  LifeFormSearch
//
//  Created by Nash Clinton on 1/4/25.
//

import UIKit

class LifeFormTableViewCell: UITableViewCell {
    
    var name: String? {
        didSet {
            setNeedsUpdateConfiguration()
        }
    }
    
    var scientificName: String? {
        didSet {
            setNeedsUpdateConfiguration()
        }
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var content = defaultContentConfiguration().updated(for: state)

        content.text = name
        content.secondaryText = scientificName

        self.contentConfiguration = content
    }

    
}
