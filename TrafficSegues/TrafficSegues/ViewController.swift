//
//  ViewController.swift
//  TrafficSegues
//
//  Created by Nash Clinton on 9/17/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwindToRed(unwindSegue: UIStoryboardSegue) {
        guard let source = unwindSegue.source as?
            GreenViewController else {
            print("It Failed!")
            return
        }
        
        print(source.textField.text)
    }
}

