import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var isShaking = false  // Flag to track animation state
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        let trimmedText = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        if trimmedText.isEmpty {
            startShaking()
        } else {
            performSegue(withIdentifier: "toNextScreen", sender: self)
        }
    }
    
    
    func startShaking() {
        guard !isShaking else { return }
        isShaking = true

        let shakeOffset: CGFloat = 10

        UIView.animateKeyframes(withDuration: 0.4, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                self.textField.transform = CGAffineTransform(translationX: -shakeOffset, y: 0)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.textField.transform = CGAffineTransform(translationX: shakeOffset, y: 0)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.textField.transform = CGAffineTransform(translationX: -shakeOffset, y: 0)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.textField.transform = CGAffineTransform.identity
            }
        }, completion: { _ in
            self.isShaking = false
        })
    }
}
