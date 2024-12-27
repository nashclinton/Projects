//
//  GamesTableViewCell.swift
//  Score Keeper
//
//  Created by Nash Clinton on 11/8/24.
//

import UIKit





class GameTableViewCell: UITableViewCell {

    
    @IBOutlet weak var gameIcon: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var currentWinnerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with game: Game) {
        gameNameLabel.text = game.name
        currentWinnerLabel.text = game.currentWinner
        gameIcon.image = UIImage(named: "icon")
    }
}
