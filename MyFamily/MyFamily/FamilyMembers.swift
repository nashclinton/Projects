//
//  FamilyMembers.swift
//  MyFamily
//
//  Created by Nash Clinton on 10/3/24.
//

import Foundation
import UIKit

struct FamilyMembers {
    var name: String
    var filename: String
    var description: String
    
    var image: UIImage? {
        UIImage(named: "\(filename)")
    }
}
