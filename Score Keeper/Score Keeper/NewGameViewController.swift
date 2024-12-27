//
//  NewGameViewController.swift
//  Score Keeper
//
//  Created by Nash Clinton on 11/12/24.
//

import UIKit

class NewGameViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, playerScoreDelegate {
    
    
    @IBOutlet weak var gameName: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    var controller = GamesController.shared
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        self.navigationItem.title = gameName.text
        
        createNewGame()
    }
    func createNewGame() {
            let gameText = gameName.text ?? "New Game"
            
            game = Game(name: gameText, currentWinner: "", players: [])
            
            controller.selectedGame = game
        
            tableView.reloadData()
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let selectedGame = controller.selectedGame else { return 0 }
        return selectedGame.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        guard var selectedGame = controller.selectedGame else { return }
        
        selectedGame.players[indexPath.row].score = score

        controller.selectedGame = selectedGame
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    @IBAction func addPlayer(_ unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "save", let sourceViewController = unwindSegue.source as? AddPlayerViewController,
            let player = sourceViewController.player else { return }
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            controller.selectedGame?.players[selectedIndexPath.row] = player
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        } else {
            let newIndexPath = IndexPath(row: controller.selectedGame!.players.count, section: 0)
            controller.selectedGame?.players.append(player)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "add game" else { return }

        let game = Game(name: gameName.text!, players: controller.selectedGame!.players)
        let controller = segue.destination as! GamesTableViewController
        controller.newGame = game
    }
}
