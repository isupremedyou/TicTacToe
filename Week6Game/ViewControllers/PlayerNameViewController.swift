//
//  PlayerNameViewController.swift
//  Week6Game
//
//  Created by Karissa McDaris on 11/13/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import UIKit

class PlayerNameViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var playerOneTextField: UITextField!
    @IBOutlet weak var playerTwoTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func tappedPlayButton(_ sender: Any) {
        guard let playerOneName = playerOneTextField.text,
            let playerTwoName = playerTwoTextField.text
            else {return}
        
        if !playerOneName.isEmpty, !playerTwoName.isEmpty {
            TicTacToeController.shared.setPlayerNamesWith(playerXName: playerOneName, playerOName: playerTwoName)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
