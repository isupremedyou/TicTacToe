//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by Travis Chapman on 11/13/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import Foundation

class TicTacToe {
    
    /// Coordinates to the TicTacToe Gameboard Spaces where the letter refers to the Y-axis and the number refers to the X-axis
    enum Point: Int {
        case a1, a2, a3, b1, b2, b3, c1, c2, c3
    }
    
    enum GameOutcome: Int {
        case win, draw, keepPlaying
    }
}

class Player {
    
    var name: String?
    var points: [TicTacToe.Point]
    
    init(name: String?) {
        
        self.name = name
        self.points = [TicTacToe.Point]()
    }
}
