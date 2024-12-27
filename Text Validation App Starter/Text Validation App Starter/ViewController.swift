//
//  ViewController.swift
//  Text Validation App Starter
//
//  Created by Jane Madsen on 10/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var statusMessageLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    
    var wantedCharacters: [String] = [",",".","!","@","#","$","%","^","&","*","<",">","?","+","=","-"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func validatePassword(_ sender: Any) {
        statusMessageLabel.textColor = .red
        if let password = passwordTextField.text, let username = usernameTextField.text {
            guard password.count >= 8 else {
                statusMessageLabel.text = "Password must be at least 8 characters long."
                return
            }
            guard password != password.lowercased() else {
                statusMessageLabel.text = "Password must contain at least one uppercase letter."
                return
            }
            guard username.contains("@")  else {
                statusMessageLabel.text = "Invalid Email Address."
                return
            }
            for character in wantedCharacters {
                if !password.contains(character) {
                    statusMessageLabel.text = "Password must contain at least one of the following characters: \(wantedCharacters.joined(separator: ", "))"
                } else {
                    statusMessageLabel.textColor = .green
                    statusMessageLabel.text = "Password is valid."
                    break
                }
            }
        }
    }
//        if let password = passwordTextField.text, let username = usernameTextField.text {
//            if password.count >= 8
//                && password != password.lowercased()
//                && username.contains("@")
//                && username.contains(".com")
//                && (password.contains(",")
//                || password.contains(".")
//                || password.contains("!")
//                || password.contains("@")
//                || password.contains("#")
//                || password.contains("$")
//                || password.contains("%")
//                || password.contains("^")
//                || password.contains("&")
//                || password.contains("*")
//                || password.contains("<")
//                || password.contains(">")
//                || password.contains("?")
//                || password.contains("+")
//                || password.contains("=")
//                || password.contains("-")){
//                statusMessageLabel.textColor = .green
//                statusMessageLabel.text = "Success!"
//            } else {
//                statusMessageLabel.textColor = .red
//                statusMessageLabel.text = "Password or email is invalid"
//            }
//        }
//    }
    
}

