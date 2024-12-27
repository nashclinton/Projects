//
//  ViewController.swift
//  WaveWord
//
//  Created by Nash Clinton on 10/4/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var techFactsLabel: UILabel!
    @IBOutlet weak var recentPostDescription: UILabel!
    @IBOutlet weak var recentPostTitle: UILabel!
    
    var profileImageInput: String = "me"
    var backgroundImageInput: String = "background 1"
    var nameInput: String = "Nash Clinton"
    var techFactsInput: [String] = ["I'm a software engineer", "I'm a developer", "I'm a coder"]
    var posts: [String: String] = [:]
        override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.frame = CGRect(x: 100, y: 100, width: 80, height: 80)
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 1
        profileImage.layer.masksToBounds = true
        
        profileImage.image = UIImage(named: "\(profileImageInput).jpg")
        backgroundImage.image = UIImage(named: "\(backgroundImageInput).jpg")
        
        nameLabel.text = nameInput
        techFactsLabel.text = bulletPointList(techFactsInput)
    }
        func bulletPointList(_ input: [String]) -> String {
            var input = input
            input[0] = "- \(input[0])"
        return input.joined(separator: "\n- ")
    }
}
