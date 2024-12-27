//
//  AddPlayerViewController.swift
//  Score Keeper
//
//  Created by Nash Clinton on 11/8/24.
//

import UIKit

class AddPlayerViewController: UIViewController {
    
    var player: Player?

    @IBOutlet weak var currentScoreTextField: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet weak var currentScoreStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentScoreTextField.text = String(Int(currentScoreStepper.value))
    }
    
    @IBAction func currentScoreStepperPressed(_ sender: Any) {
        currentScoreTextField.text = String(Int(currentScoreStepper.value))
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "save" else { return }
        
        let nameText = nameTextField.text ?? ""
        let scoreNumber = currentScoreStepper.value
        
        player = Player(name: nameText, score: Int(scoreNumber))
    }

}
