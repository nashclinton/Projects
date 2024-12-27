//
//  AddEditEmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Nash Clinton on 10/22/24.
//

import UIKit

class AddEditBookTableViewController: UITableViewController {
    
    var book: Book?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    init?(coder: NSCoder, book:Book?) {
        self.book = book
        super.init(coder:coder)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let book {
            titleTextField.text = book.title
            authorTextField.text = book.author
            genreTextField.text = book.genre
            lengthTextField.text = "\(book.length)"
            title = "Edit Book"
        } else {
            title = "Add Book"
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
        let lengthText = lengthTextField.text ?? ""
        saveButton.isEnabled = !titleText.isEmpty && !authorText.isEmpty && !genreText.isEmpty && !lengthText.isEmpty
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "save" else { return }
        
        let titleText = titleTextField.text ?? ""
        let authorText = authorTextField.text ?? ""
        let genreText = genreTextField.text ?? ""
        let lengthText = lengthTextField.text ?? ""
        
        book = Book(title: titleText, author: authorText, genre: genreText, length: Int(lengthText) ?? 0)
    }
}
    
