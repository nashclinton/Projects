//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by Nash Clinton on 9/27/24.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    
    var questions: [Question] = [
      
      Question(text: "Which word describes you best?",
               type: .single,
               answers: [
                Answer(text: "Chill", type: .vanilla),
                Answer(text: "Fun", type: .strawberry),
                Answer(text: "Warm", type: .chocolate),
                Answer(text: "Smart", type: .mint)
        ]),
      
        Question(text: "Which activity do you enjoy?",
                 type: .multiple,
                 answers: [
                  Answer(text: "Netflix", type: .chocolate),
                  Answer(text: "Swimming", type: .vanilla),
                  Answer(text: "Dancing", type: .strawberry),
                  Answer(text: "Hiking", type: .mint)
        ]),
          Question(text: "Do you even like ice cream?",
                   type: .single,
                   answers: [
                    Answer(text: "Yes", type: .chocolate),
                    Answer(text: "Hard Yes", type: .vanilla),
                    Answer(text: "100% Yes", type: .mint),
                    Answer(text: "Yes Yes Yes", type: .strawberry)
        ]),
        
      
      Question(text: "How much do you enjoy being around people",
               type: .ranged,
               answers: [
                Answer(text: "Not at all", type: .chocolate),
                Answer(text: "Occasionally", type: .mint),
                Answer(text: "Sometimes", type: .vanilla),
                Answer(text: "All the time", type: .strawberry)
        ]),
      
      Question(text: "Dream Car",
               type: .single,
               answers: [
                Answer(text: "G-Wagon", type: .mint),
                Answer(text: "Lamborgini", type: .vanilla),
                Answer(text: "Bentley", type: .chocolate),
                Answer(text: "Porche 911", type: .strawberry)
        ]),
      
      Question(text: "Would you consider yourself creative?",
               type: .ranged,
               answers: [
                Answer(text: "Not at all", type: .mint),
                Answer(text: "Occasionally", type: .vanilla),
                Answer(text: "Sometimes", type: .chocolate),
                Answer(text: "Super Creative", type: .strawberry)
        ]),
      
      Question(text: "What's your favorite color?",
               type: .single,
               answers: [
                Answer(text: "Blue", type: .vanilla),
                Answer(text: "Red", type: .strawberry),
                Answer(text: "Black", type: .chocolate),
                Answer(text: "Green", type: .mint)
        ]),
      Question(text: "Which of the following do you agree with?",
               type: .multiple,
               answers: [
                Answer(text: "I Should Go Outside more...", type: .chocolate),
                Answer(text: "Procrastination is my greatest enemy", type: .vanilla),
                Answer(text: "Friends? I think I talked to them once", type: .mint),
                Answer(text: "I am literally ryan gossling", type: .strawberry)
        ]),
    ]
    
    var questionIndex = 0
    var answerChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, response: answerChosen)
    }
    
        
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answers
        
        switch sender {
            case singleButton1:
            answerChosen.append(currentAnswer[0])
        case singleButton2:
            answerChosen.append(currentAnswer[1])
        case singleButton3:
            answerChosen.append(currentAnswer[2])
        case singleButton1:
            answerChosen.append(currentAnswer[3])
        default:
            break
        }
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswer = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answerChosen.append(currentAnswer[0])
        }
        if multiSwitch2.isOn {
            answerChosen.append(currentAnswer[1])
        }
        if multiSwitch3.isOn {
            answerChosen.append(currentAnswer[2])
        }
        if multiSwitch4.isOn {
            answerChosen.append(currentAnswer[3])
        }
        nextQuestion()
    }
    
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answerChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
        
        func updateUI() {
            singleStackView.isHidden = true
            multipleStackView.isHidden = true
            rangedStackView.isHidden = true
            
            let currentQuestion = questions[questionIndex]
            let currentAnswers = currentQuestion.answers
            let totalProgress = Float(questionIndex) / Float(questions.count)
            
            navigationItem.title = "Question #\(questionIndex + 1)"
            questionLabel.text = currentQuestion.text
            questionProgressView.setProgress(totalProgress, animated: true)
            
            switch currentQuestion.type {
            case .single:
                updateSingleStack(using: currentAnswers)
            case .multiple:
                updateMultipleStack(using: currentAnswers)
            case .ranged:
                updateRangedStack(using: currentAnswers)
            }
        }
    
    
        
        func updateSingleStack (using answers: [Answer]) {
            singleStackView.isHidden = false
            singleButton1.setTitle(answers[0].text, for: .normal)
            singleButton2.setTitle(answers[1].text, for: .normal)
            singleButton3.setTitle(answers[2].text, for: .normal)
            singleButton4.setTitle(answers[3].text, for: .normal)
        }
        
        func updateMultipleStack (using answers: [Answer]) {
            multipleStackView.isHidden = false
            multiSwitch1.isOn = false
            multiSwitch2.isOn = false
            multiSwitch3.isOn = false
            multiSwitch4.isOn = false
            multiLabel1.text = answers[0].text
            multiLabel2.text = answers[1].text
            multiLabel3.text = answers[2].text
            multiLabel4.text = answers[3].text
        }
        
        func updateRangedStack (using answers: [Answer]) {
            rangedStackView.isHidden = false
            rangedSlider.setValue(0.5, animated: false)
            rangedLabel1.text = answers.first?.text
            rangedLabel2.text = answers.last?.text
            
        }
    


}
