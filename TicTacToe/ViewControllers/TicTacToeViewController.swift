//
//  TicTacToeViewController.swift
//  TicTacToe
//
//  Created by Karissa McDaris on 11/13/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {
    
    
    // MARK: - Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var tappedSquares = [UIButton]()
    var allSquares = [UIButton]()
    
    // MARK: - Outlets
    
    @IBOutlet weak var resetGameButton: UIButton!
    @IBOutlet weak var playerTurnLabel: UILabel!
    
    @IBOutlet weak var square1: UIButton!
    @IBOutlet weak var square2: UIButton!
    @IBOutlet weak var square3: UIButton!
    @IBOutlet weak var square4: UIButton!
    @IBOutlet weak var square5: UIButton!
    @IBOutlet weak var square6: UIButton!
    @IBOutlet weak var square7: UIButton!
    @IBOutlet weak var square8: UIButton!
    @IBOutlet weak var square9: UIButton!
    
    
    // MARK: - Life Cycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUIElements()
        allSquares = [square1, square2, square3, square4, square5, square6, square7, square8, square9]
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        TicTacToeController.shared.resetGame()
    }
    
    // MARK: - Actions
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        resetBoard()
    }
    
    @IBAction func squareButtonTapped(_ sender: UIButton!) {
        
        updateSquare(button: sender)
    }
    
    // MARK: - Functions
    
    fileprivate func setupUIElements() {
        
        // Set the turn label
        updateTurnLabel(withText: nil)
        
        resetGameButton.setCornerRadius(8)
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    fileprivate func updateTurnLabel(withText text: String?) {
        
        if let text = text {
            playerTurnLabel.text = text
            return
        }
        
        if TicTacToeController.shared.isPlayerXTurn {
            playerTurnLabel.text = "\(TicTacToeController.shared.playerX.name!)'s turn"
        } else {
            playerTurnLabel.text = "\(TicTacToeController.shared.playerO.name!)'s turn"
        }
    }
    
    fileprivate func highlightWinningSequence() {
        
        let winningSequence = TicTacToeController.shared.winningSequence
        
        for square in tappedSquares {
            if winningSequence.contains(TicTacToe.Point(rawValue: square.tag)!) {
                square.tintColor = UIColor.black
            }
        }
    }
    
    func updateSquare(button: UIButton) {
        
        // Update the state of the button to disabled to prevent further actions
        button.isEnabled = false
        
        // Adds the button to an array of tappedSquares which will be used to reset the board latter
        tappedSquares.append(button)
        
        // Updates the image displayed depending on the status of the button
        if TicTacToeController.shared.isPlayerXTurn {
            button.setBackgroundImage(UIImage(named: "X"), for: .disabled)
        } else {
            button.setBackgroundImage(UIImage(named: "O"), for: .disabled)
        }
        
        let point = button.tag

        let gameOutcome = TicTacToeController.shared.turnTaken(atPoint: TicTacToe.Point(rawValue: point)!)
        
        if gameOutcome == .win {
            guard let winnerName = TicTacToeController.shared.winningPlayer?.name else { return }
            highlightWinningSequence()
            updateTurnLabel(withText: "\(winnerName) wins!")
            allSquares.map({$0.isEnabled = false})
            return
        } else if gameOutcome == .draw {
            updateTurnLabel(withText: "Draw!")
            allSquares.map({$0.isEnabled = false})
            return
        }
        
        updateTurnLabel(withText: nil)
    }
    
    func resetBoard() {
        
        TicTacToeController.shared.resetGame()
        
        updateTurnLabel(withText: nil)
        
        allSquares.map({$0.isEnabled = true ; $0.tintColor = UIColor.white ; $0.setBackgroundImage(nil, for: .disabled)})
        tappedSquares = []
    }
}
