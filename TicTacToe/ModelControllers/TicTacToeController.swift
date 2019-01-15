//
//  TicTacToeController.swift
//  TicTacToe
//
//  Created by Travis Chapman on 11/13/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import Foundation

class TicTacToeController {
    
    // Singleton
    static let shared = TicTacToeController()
    private init() {}
    
    // Shared truth
    var playerX = Player(name: "X")
    var playerO = Player(name: "O")
    var winningPlayer: Player?
    var winningSequence = [TicTacToe.Point]()
    var isPlayerXTurn = true
    var turnNumber = 0
    
    func setPlayerNamesWith(playerXName xName: String, playerOName oName: String) {
        
        playerX.name = xName
        playerO.name = oName
    }
    
    func turnTaken(atPoint point: TicTacToe.Point) -> TicTacToe.GameOutcome {

        turnNumber += 1
        var gameOutcome: TicTacToe.GameOutcome?
        
        if isPlayerXTurn {
            playerX.points.append(point)
            gameOutcome = checkGameResult(currentPlayersPoints: playerX.points)
        } else {
            playerO.points.append(point)
            gameOutcome =  checkGameResult(currentPlayersPoints: playerO.points)
        }
        
        if gameOutcome == .win {
            if isPlayerXTurn {
                winningPlayer = playerX
            } else {
                winningPlayer = playerO
            }
            
            return gameOutcome!
        }
        
        isPlayerXTurn = !isPlayerXTurn
        return gameOutcome!
    }
    
    func checkGameResult(currentPlayersPoints points: [TicTacToe.Point]) -> TicTacToe.GameOutcome {
        
        switch true {
        case points.contains(.a1) && points.contains(.a2) && points.contains(.a3):
            winningSequence = [.a1, .a2, .a3]
            return .win
        case points.contains(.b1) && points.contains(.b2) && points.contains(.b3):
            winningSequence = [.b1, .b2, .b3]
            return .win
        case points.contains(.c1) && points.contains(.c2) && points.contains(.c3):
            winningSequence = [.c1, .c2, .c3]
            return .win
        case points.contains(.a1) && points.contains(.b1) && points.contains(.c1):
            winningSequence = [.a1, .b1, .c1]
            return .win
        case points.contains(.a2) && points.contains(.b2) && points.contains(.c2):
            winningSequence = [.a2, .b2, .c2]
            return .win
        case points.contains(.a3) && points.contains(.b3) && points.contains(.c3):
            winningSequence = [.a3, .b3, .c3]
            return .win
        case points.contains(.a1) && points.contains(.b2) && points.contains(.c3):
            winningSequence = [.a1, .b2, .c3]
            return .win
        case points.contains(.a3) && points.contains(.b2) && points.contains(.c1):
            winningSequence = [.a3, .b2, .c1]
            return .win
        default:
            if turnNumber != 9 {
                return .keepPlaying
            } else {
                return .draw
            }
        }
        
    }
    
    func resetGame() {
        
        playerX.points = []
        playerO.points = []
        winningSequence = []
        winningPlayer = nil
        isPlayerXTurn = true
        turnNumber = 0
    }
}
