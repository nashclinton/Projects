//
//  ScoreKeeperTableViewController.swift
//  Score Keeper
//
//  Created by Nash Clinton on 11/6/24.
//

import UIKit

class ScoreKeeperTableViewController: UITableViewController, playerScoreDelegate {
    
    var controller = GamesController.shared
    var player: Player?
    var delegate: GameUpdateDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = controller.selectedGame?.name
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let selectedGame = controller.selectedGame else { return 0 }
        return selectedGame.players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let selectedGame = controller.selectedGame else { return UITableViewCell() }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "player cell", for: indexPath) as? ScoreKeeperTableViewCell else {
            return UITableViewCell()
        }
        
        let player = selectedGame.players[indexPath.row]
        cell.update(with: player)
        
        cell.delegate = self
        
        return cell
    }
    
    
    func scoreKeeperTableViewCell(_ cell: ScoreKeeperTableViewCell, didUpdateScoreFor score: Int) {
        guard let indexPath = tableView.indexPath(for: cell), var selectedGame = controller.selectedGame else { return }

        selectedGame.players[indexPath.row].score = score

        controller.selectedGame = selectedGame

        if let gameIndex = controller.games.firstIndex(where: { $0.name == selectedGame.name }) {
            controller.games[gameIndex] = selectedGame
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
        delegate?.gameUpdated(selectedGame)
    }
    @IBAction func saveChanges(_ sender: UIButton) {
        if var selectedGame = controller.selectedGame {
            let newWinner = controller.currentWinnerFound(for: selectedGame)
            selectedGame.currentWinner = newWinner
        }
        performSegue(withIdentifier: "update players", sender: self)
    }
}

