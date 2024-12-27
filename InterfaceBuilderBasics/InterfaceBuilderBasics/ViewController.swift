//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Nash Clinton on 10/1/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeTitle(_ sender: Any) {
        mainLabel.text = "This App Rocks!"
    }
    
}

