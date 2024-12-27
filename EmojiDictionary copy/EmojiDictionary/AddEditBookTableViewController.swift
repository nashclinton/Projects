//
//  AddEditBookTableViewController.swift
//  BookDictionary
//
//  Created by Nash Clinton on 10/22/24.
//

import UIKit

class AddEditBookTableViewController: UITableViewController {
    
    var book: Book?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    required init?(coder: NSCoder) {
            super.init(coder: coder)
        }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Check if there is a book to edit
        if let book = book {
            titleTextField.text = book.icon
            authorTextField.text = book.name
            dueDatePicker.date = book.dueDate
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
        saveButton.isEnabled = !titleText.isEmpty && !authorText.isEmpty
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "save" else { return }

        let titleText = titleTextField.text ?? ""
        let authorText = authorTextField.text ?? ""
        let dueDateText = dueDatePicker.date

        book = Book(icon: titleText, name: authorText, dueDate: dueDateText)
    }
}
