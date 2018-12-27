//
//  PlayerNameViewController.swift
//  TicTacToe
//
//  Created by Karissa McDaris on 11/13/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import UIKit

class PlayerNameViewController: UIViewController {
    
    // MARK: - Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var playerOneTextField: UITextField!
    @IBOutlet weak var playerTwoTextField: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    // MARK: - Life Cycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Delegates
        playerOneTextField.delegate = self
        playerTwoTextField.delegate = self
        
        setupUIElements()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        playerOneTextField.becomeFirstResponder()
    }
    
    // MARK: - Actions
    
    @IBAction func tappedPlayButton(_ sender: Any) {
        
        guard let playerOneName = playerOneTextField.text, !playerOneName.isEmpty,
            let playerTwoName = playerTwoTextField.text, !playerTwoName.isEmpty
            else { return }
        
        view.endEditing(true)
        TicTacToeController.shared.setPlayerNamesWith(playerXName: playerOneName, playerOName: playerTwoName)
        performSegue(withIdentifier: "toGameBoardVC", sender: self)
    }
    
    @IBAction func viewWasTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: - Functions
    
    fileprivate func setupUIElements() {
        
        // Adjust the status bar
        setNeedsStatusBarAppearanceUpdate()
        
        // Setup the button corner radius
        playButton.setCornerRadius(8)
    }
}

extension PlayerNameViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case playerOneTextField:
            playerTwoTextField.becomeFirstResponder()
        case playerTwoTextField:
            tappedPlayButton(playerTwoTextField)
        default:
            break
        }
        
        return true
    }
}
