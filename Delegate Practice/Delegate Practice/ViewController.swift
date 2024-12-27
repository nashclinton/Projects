//
//  ViewController.swift
//  Delegate Practice
//
//  Created by Nash Clinton on 10/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var didFinishLaunchLabel: UILabel!
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    @IBOutlet weak var willResignActiveLabel: UILabel!
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    @IBOutlet weak var didEnterBackgroundLabel: UILabel!
    @IBOutlet weak var willConnectLabel: UILabel!
    @IBOutlet weak var forConnectingLabel: UILabel!
    
    var didBecomeActiveCount = 0
    var willResignActiveCount = 0
    var willEnterForegroundCount = 0
    var didEnterBackgroundCount = 0
    var willConnectCount = 0

    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func updateView() {
        didFinishLaunchLabel.text = "The App has Launched \(appDelegate.launchCount) time(s)"
        didBecomeActiveLabel.text = "The App has Become Active \(didBecomeActiveCount) time(s)"
        willResignActiveLabel.text = "The App will Resign Active \(willResignActiveCount) time(s)"
        willEnterForegroundLabel.text = "The App will Enter Foreground \(willEnterForegroundCount) time(s)"
        didEnterBackgroundLabel.text = "The App did Enter Background \(didEnterBackgroundCount) time(s)"
        forConnectingLabel.text = "The App is Connecting \(appDelegate.configurationForConnectingCount) time(s)"
        willConnectLabel.text = "The App will Connect \(willConnectCount) time(s)"
    }

}

