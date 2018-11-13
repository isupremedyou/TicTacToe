//
//  TicTacToeViewController.swift
//  Week6Game
//
//  Created by Karissa McDaris on 11/13/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func a1ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
        print("\(sender.accessibilityIdentifier)")
    }
    @IBAction func b1ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
        print("\(sender.accessibilityIdentifier)")
        
    }
    @IBAction func c1ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
        
        print("\(sender.accessibilityIdentifier)")
    }
    @IBAction func a2ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
        print("\(sender.accessibilityIdentifier)")
    }
    @IBAction func b2ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
        print("\(sender.accessibilityIdentifier)")
    }
    @IBAction func c2ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
        print("\(sender.accessibilityIdentifier)")
    }
    @IBAction func a3ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
        print("\(sender.accessibilityIdentifier)")
    }
    @IBAction func b3ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
        print("\(sender.accessibilityIdentifier)")
    }
    @IBAction func c3ButtonWasTapped(_ sender: UIButton!) {
        updateSquare(sender: sender)
        print("\(sender.accessibilityIdentifier)")
    }
    
    func updateSquare(sender: Any){
        let button = sender as! UIButton
        button.isEnabled = false
        
        if TicTacToeController.shared.isPlayerXTurn {
            button.setBackgroundImage(UIImage(named: "Week6GameX"), for: .disabled)
        } else {
            button.setBackgroundImage(UIImage(named: "Week6GameO"), for: .disabled)
        }
        
        guard let point = button.accessibilityIdentifier else { return }

        let gameOutcome = TicTacToeController.shared.turnTaken(atPoint: TicTacToe.Point(rawValue: point)!)
        
        if gameOutcome == .win {
            presentAlertController()
            print("win")
        } else if gameOutcome == .draw {
            print("draw")
        } else if gameOutcome == .keepPlaying {
            print("keep playing")
        }
    }
    
    func presentAlertController() {
        
        //create a constant for the winners name
        
        let alert = UIAlertController(title: "Winner!!!", message: "[player] won!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play Again!", style: .default) { (_) in
            TicTacToeController.shared.resetGame()
            self.navigationController?.popViewController(animated: true)
            print("game reset")
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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
