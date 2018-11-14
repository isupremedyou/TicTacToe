//
//  TicTacToeViewController.swift
//  Week6Game
//
//  Created by Karissa McDaris on 11/13/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {
    
    
    // MARK: - Properties
    
    var tappedSquares = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        TicTacToeController.shared.resetGame()
    }
    
    // MARK: - Actions
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        resetBoard()
    }
    
    @IBAction func squareButtonTapped(_ sender: UIButton!) {
        updateSquare(button: sender)
    }
    
    func updateSquare(button: UIButton){
        
        // Update the state of the button to disabled to prevent further actions
        button.isEnabled = false
        
        // Adds the button to an array of tappedSquares which will be used to reset the board latter
        tappedSquares.append(button)
        
        // Updates the image displayed depending on the status of the button
        if TicTacToeController.shared.isPlayerXTurn {
            button.setBackgroundImage(UIImage(named: "Week6GameX"), for: .disabled)
        } else {
            button.setBackgroundImage(UIImage(named: "Week6GameO"), for: .disabled)
        }
        
        guard let point = button.accessibilityIdentifier else { return }

        let gameOutcome = TicTacToeController.shared.turnTaken(atPoint: TicTacToe.Point(rawValue: point)!)
        
        if gameOutcome == .win {
            presentWinAlertController()
        } else if gameOutcome == .draw {
            presentDrawAlertController()
        }
    }
    
    func presentWinAlertController() {
        
        guard let winnerName = TicTacToeController.shared.winningPlayer.name else { return }
        
        let winAlertController = UIAlertController(title: "Winner!!!", message: "\(winnerName) won!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play Again!", style: .default) { (_) in
            TicTacToeController.shared.resetGame()
            self.resetBoard()
        }
        winAlertController.addAction(action)
        present(winAlertController, animated: true, completion: nil)
    }
    
    func presentDrawAlertController() {
        
        let drawAlertController = UIAlertController(title: "Draw!", message: "No winner this time! Play again!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play Again!", style: .default) { (_) in
            self.resetBoard()
        }
        drawAlertController.addAction(action)
        present(drawAlertController, animated: true, completion: nil)
    }
    
    func resetBoard() {
        
        TicTacToeController.shared.resetGame()
        tappedSquares.map({$0.isEnabled = true ; $0.setBackgroundImage(nil, for: .disabled)})
        tappedSquares = [UIButton]()
    }
}
