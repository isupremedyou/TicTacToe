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
    
    @IBAction func a1ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
    }
    @IBAction func b1ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
    }
    @IBAction func c1ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
    }
    @IBAction func a2ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
    }
    @IBAction func b2ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
    }
    @IBAction func c2ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
    }
    @IBAction func a3ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
    }
    @IBAction func b3ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
    }
    @IBAction func c3ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
    }
    
    func updateSquare(sender: Any){
        let button = sender as! UIButton
        button.isEnabled = false
        tappedSquares.append(button)
        
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
            TicTacToeController.shared.resetGame()
            self.resetBoard()
        }
        drawAlertController.addAction(action)
        present(drawAlertController, animated: true, completion: nil)
    }
    
    func resetBoard() {
        
        tappedSquares.compactMap({$0.isEnabled = true})
        
        tappedSquares = [UIButton]()
    }
}
