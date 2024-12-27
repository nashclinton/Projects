//
//  ViewController.swift
//  BasicInteraction
//
//  Created by Nash Clinton on 10/4/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setTextButtonTapped(_ sender: Any) {
        let text = textField.text ?? ""
        label.text = text
    }
    
    @IBAction func clearTextButtonTapped(_ sender: Any) {
        let text = ""
        label.text = text
    }
}

