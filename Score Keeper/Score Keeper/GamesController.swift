//
//  games controller.swift
//  Score Keeper
//
//  Created by Nash Clinton on 11/11/24.
//

import Foundation

class GamesController {
    static let shared = GamesController()
    var selectedGame: Game?
    
    var games: [Game] = [
        Game(name: "Game 1", currentWinner: "", players: [
            Player(name: "Nash Clinton", score: 0),
            Player(name: "John Doe", score: 0),
            Player(name: "Jane Doe", score: 0),
            Player(name: "Sam Smith", score: 0),
        ]),
        Game(name: "Game 2", currentWinner: "", players: [
            Player(name: "Nash Clinton1", score: 1),
            Player(name: "John Doe", score: 0),
            Player(name: "Jane Doe", score: 0),
            Player(name: "Sam Smith", score: 0),
        ]),
        Game(name: "Game 3", currentWinner: "", players: [
            Player(name: "Nash Clinton2", score: 2),
            Player(name: "John Doe", score: 0),
            Player(name: "Jane Doe", score: 0),
            Player(name: "Sam Smith", score: 0),
        ])
    ]
    
    func updateCurrentWinner() {
        for i in 0 ..< games.count {
            games[i].currentWinner = currentWinnerFound(for: games[i])
        }
    }
    
    func setPlayerScore(for game: inout Game, with player: Player, and score: Int) {
        if let index = game.players.firstIndex(where: { $0.name == player.name }) {
            game.players[index].score = score
        }
    }
    
    func currentWinnerFound(for game: Game) -> String {
        if let highestScoringPlayer = game.players.max(by: { $0.score < $1.score }) {
            return highestScoringPlayer.name
        }
        return "No players"
    }
}
