//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Nash Clinton on 9/19/24.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var eventNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let actualText = label.text {
            label.text = "\(actualText)\(eventNumber) viewDidLoad \n"
            eventNumber += 1
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let actualText = label.text {
            label.text = "\(actualText)\(eventNumber) viewWillAppear \n"
            eventNumber += 1
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let actualText = label.text {
            label.text = "\(actualText)\(eventNumber) viewDidAppear \n"
            eventNumber += 1
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let actualText = label.text {
            label.text = "\(actualText)\(eventNumber) viewWillDisappear \n"
            eventNumber += 1
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let actualText = label.text {
            label.text = "\(actualText)\(eventNumber) viewDidDisappear \n"
            eventNumber += 1
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
