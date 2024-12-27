//
//  EmojiTableViewCell.swift
//  EmojiDictionary
//
//  Created by Nash Clinton on 10/22/24.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var didCompleteButton: UIButton!
    

       let incompleteImage = UIImage(systemName: "checkmark.circle")
       let completeImage = UIImage(systemName: "checkmark.circle.fill")

       override func awakeFromNib() {
           super.awakeFromNib()

           didCompleteButton.setImage(incompleteImage, for: .normal)

           didCompleteButton.imageView?.contentMode = .scaleAspectFit

           didCompleteButton.addTarget(self, action: #selector(didCompleteButtonTapped), for: .touchUpInside)
       }

       @objc func didCompleteButtonTapped() {

           if didCompleteButton.image(for: .normal) == incompleteImage {

               didCompleteButton.setImage(completeImage, for: .normal)
           } else {

               didCompleteButton.setImage(incompleteImage, for: .normal)
           }
       }

       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
       }

       func update(with book: Book) {
           titleLabel.text = book.icon
           authorLabel.text = "By: " + book.name
           let dateFormatter = DateFormatter()
           dateFormatter.dateStyle = .short
           dateFormatter.timeStyle = .none
           dueDateLabel.text = "Due: " + dateFormatter.string(from: book.dueDate)
       }
   }
