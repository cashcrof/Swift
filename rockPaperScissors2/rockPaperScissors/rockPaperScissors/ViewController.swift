//
//  ViewController.swift
//  rockPaperScissors
//
//  Created by user223323 on 11/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var compImageView: UIImageView!
    @IBOutlet var playerImageView: UIImageView!
    @IBOutlet var scoreLabel: UILabel!
    let imageNames: [String] = ["rock", "paper", "scissors"]
    
    var playerPoints: Int = 0
    var compPoints: Int = 0
    var ties: Int = 0
    var compSelection: Int = 0
    var playerSelection: Int = 0
    
    @IBAction func changeButton(_ sender: Any) {
        playerSelection += 1
        if (playerSelection > 2){
            playerSelection = 0
        }
        let playerImage: String = imageNames[playerSelection]
        playerImageView.image = UIImage(named: playerImage)
    }
    
    @IBAction func selectButton(_ sender: Any) {
        let compImage = imageNames.randomElement()
        compSelection = imageNames.firstIndex(of: compImage ?? "rock")!
        compImageView.image = UIImage(named: compImage!)
        if (compSelection == playerSelection){
            ties += 1
        }
        else if (playerSelection == 0){
            if (compSelection == 2){
                playerPoints += 1
            }
            else {
                compPoints += 1
            }
        }
        else if (playerSelection == 1){
            if (compSelection == 0){
                playerPoints += 1
            }
            else {
                compPoints += 1
            }
        }
        else if (playerSelection == 2){
            if (compSelection == 1){
                playerPoints += 1
            }
            else {
                compPoints += 1
            }
        }
        scoreLabel.text = "Total Scores: Computer \(compPoints), You \(playerPoints), Ties \(ties)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

