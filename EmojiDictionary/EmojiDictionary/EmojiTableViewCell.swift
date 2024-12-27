//
//  EmojiTableViewCell.swift
//  EmojiDictionary
//
//  Created by Nash Clinton on 10/22/24.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func update(with emoji: Emoji) {
        titleLabel.text = emoji.icon
        authorLabel.text = emoji.name
        genreLabel.text = emoji.description
    }
}
