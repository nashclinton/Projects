//
//  GamesTableViewController.swift
//  Score Keeper
//
//  Created by Nash Clinton on 11/8/24.
//

import UIKit

//protocol GameDelegate: AnyObject {
//    func gameDidUpdate(_ game: [Game])
//    func gameNumberSelected(_ gameNumber: Int?)
//}
 protocol GameUpdateDelegate: AnyObject {
     func gameUpdated(_ game: Game)
}

class GamesTableViewController: UITableViewController, GameUpdateDelegate {
    
    func gameUpdated(_ game: Game) {
        for (index, oldGame) in controller.games.enumerated() {
            if oldGame.name == game.name {
                controller.games[index] = game
            }
            controller.updateCurrentWinner()
            tableView.reloadData()
        }
    }
    
    var controller = GamesController.shared
    var newGame: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.games.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var game = controller.games[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "game cell", for: indexPath) as? GameTableViewCell else {
            return UITableViewCell()
        }
        let winner = controller.currentWinnerFound(for: game)
        game.currentWinner = winner
        
        cell.update(with: game)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            var games = controller.games
            
            games.remove(at: indexPath.row)
            
            controller.games = games
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        controller.selectedGame = controller.games[indexPath.row]
    }
    
    @IBAction func addGame(_ unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "add game",
              let sourceViewController = unwindSegue.source as? NewGameViewController,
              let newGame = newGame else {
            return
        }
        let newIndexPath = IndexPath(row: controller.games.count, section: 0)
        controller.games.append(newGame)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
 
    @IBSegueAction func scoreKeeperSegueAction(_ coder: NSCoder) -> ScoreKeeperTableViewController? {
        let vc = ScoreKeeperTableViewController(coder: coder)
        vc?.delegate = self
        return vc
    }
}
