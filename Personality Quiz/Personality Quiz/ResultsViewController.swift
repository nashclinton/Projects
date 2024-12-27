//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by Nash Clinton on 9/27/24.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    var response: [Answer]
    
    init?(coder:NSCoder, response: [Answer]) {
        self.response = response
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResults()
        navigationItem.hidesBackButton = true
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "\(calculatePersonalityResults()!).png")!)
    }
    
    func calculatePersonalityResults() -> String? {
        let frequencyOfAnswers = response.reduce(into: [:]) {
            (count, answer) in count[answer.type, default: 0] += 1
        }
        
        let sortedAnswers = frequencyOfAnswers.sorted { $0.1 > $1.1 }
        
        guard let highestFrequency = sortedAnswers.first?.value else {
            return nil // Handle the case where there are no answers
        }
        
        // Check how many answers share the highest frequency
        let tiedAnswers = sortedAnswers.filter { $0.value == highestFrequency }
        
        if tiedAnswers.count == 1 {
            // Only one type has the highest frequency
            let mostCommonAnswer = tiedAnswers.first!.key
            resultAnswerLabel.text = "Your flavor is \(mostCommonAnswer.rawValue)!"
            resultDefinitionLabel.text = mostCommonAnswer.definition
            return mostCommonAnswer.rawValue
        } else {
            // More than one type has the highest frequency
            // Return pistachio if there's a tie among the top responses
            resultAnswerLabel.text = "Your flavor is pistachio!"
            resultDefinitionLabel.text = "You are the wild card of the group. One moment you want to be alone and the next thing you know you are hosting a party. Did you actually just agree to that? Sometimes you overstep what you can and cannot do, but you say yes to it anyways. Now that you think of it, what haven't you done?"
            return "Pistachio"
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
