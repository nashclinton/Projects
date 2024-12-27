//
//  AddEditEmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Nash Clinton on 10/22/24.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {
    
    var emoji: Emoji?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    init?(coder: NSCoder, emoji:Emoji?) {
        self.emoji = emoji
        super.init(coder:coder)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let emoji {
            titleTextField.text = emoji.icon
            authorTextField.text = emoji.name
            genreTextField.text = emoji.description
            title = "Edit Emoji"
        } else {
            title = "Add Emoji"
        }
        updateSaveButton()
    }
    @IBAction func textEditingChanged(_ sender: Any) {
        updateSaveButton()
    }
    func updateSaveButton() {
        let titleText = titleTextField.text ?? ""
        let authorText = authorTextField.text ?? ""
        let genreText = genreTextField.text ?? ""
        saveButton.isEnabled = !titleText.isEmpty && !authorText.isEmpty && !genreText.isEmpty
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "save" else { return }
        
        let titleText = titleTextField.text ?? ""
        let authorText = authorTextField.text ?? ""
        let genreText = genreTextField.text ?? ""
        
        emoji = Emoji(icon: titleText, name: authorText, description: genreText)
    }
}
    
