//
//  ScoreKeeperTableViewCell.swift
//  Score Keeper
//
//  Created by Nash Clinton on 11/6/24.
//

import UIKit

protocol playerScoreDelegate: AnyObject {
    func scoreKeeperTableViewCell(_ cell: ScoreKeeperTableViewCell, didUpdateScoreFor score: Int)
}

class ScoreKeeperTableViewCell: UITableViewCell {

    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var scoreStepper: UIStepper!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playerIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var delegate: playerScoreDelegate?
    
    func update(with player: Player) {
        playerNameLabel.text = player.name
        print(player.name)
        scoreLabel.text = "\(player.score)"
        print(player.score)
        playerIcon.image = UIImage(named: "icon")
        self.scoreStepper.value = Double(player.score)

    }
    
    @IBAction func scoreStepperChanged(_ sender: UIStepper) {
        let newScore = Int(sender.value)
        delegate?.scoreKeeperTableViewCell(self, didUpdateScoreFor: newScore)
    }
}
