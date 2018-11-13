//
//  TicTacToeController.swift
//  Week6Game
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
    var playerX = Player(name: "Player X")
    var playerO = Player(name: "Player O")
    var isPlayerXTurn = true
    var turnNumber = 0
    
    func setPlayerNamesWith(playerXName xName: String, playerOName oName: String) {
        
        playerX.name = xName
        playerO.name = oName
    }
    
    func turnTaken(atPoint point: TicTacToe.Point) -> TicTacToe.GameOutcome {

        
        if isPlayerXTurn {
            
            isPlayerXTurn = false
            playerX.points.append(point)
            return checkGameResult(currentPlayersPoints: playerX.points)
        } else {
            
            isPlayerXTurn = true
            playerO.points.append(point)
            return checkGameResult(currentPlayersPoints: playerO.points)
        }
    }
    
    func checkGameResult(currentPlayersPoints points: [TicTacToe.Point]) -> TicTacToe.GameOutcome {
        
        turnNumber += 1
        
        switch true {
        case points.contains(.a1) && points.contains(.a2) && points.contains(.a3):
            return .win
        case points.contains(.b1) && points.contains(.b2) && points.contains(.b3):
            return .win
        case points.contains(.c1) && points.contains(.c2) && points.contains(.c3):
            return .win
        case points.contains(.a1) && points.contains(.b1) && points.contains(.c1):
            return .win
        case points.contains(.a2) && points.contains(.b2) && points.contains(.c2):
            return .win
        case points.contains(.a3) && points.contains(.b3) && points.contains(.c3):
            return .win
        case points.contains(.a1) && points.contains(.b2) && points.contains(.c3):
            return .win
        case points.contains(.a3) && points.contains(.b2) && points.contains(.c1):
            return .win
        default:
            if turnNumber != 8 {
                return .keepPlaying
            } else {
                return .draw
            }
        }
        
    }
    
    func resetGame() {
        
        playerX = Player(name: "Player X")
        playerO = Player(name: "Player O")
        isPlayerXTurn = true
        turnNumber = 0
    }
}
