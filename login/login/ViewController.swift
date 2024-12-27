//
//  ViewController.swift
//  login
//
//  Created by Nash Clinton on 9/20/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var forgotUsername: UIButton!
    
    @IBOutlet weak var forgotPassword: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        
        if sender == forgotUsername {
            segue.destination.navigationItem.title = "Forgot Username"
        } else if sender == forgotPassword {
            segue.destination.navigationItem.title = "Forgot Password"
        } else {
            segue.destination.navigationItem.title = username.text
        }
    }
    
    
    @IBAction func forgotUsernameButton(_ sender: UIButton) {
        performSegue(withIdentifier: "forgotUsernameOrPassword", sender: forgotUsername)
    }
    
    @IBAction func forgotPasswordButton(_ sender: UIButton) {
        performSegue(withIdentifier: "forgotUsernameOrPassword", sender: forgotPassword)
    }
    
}

