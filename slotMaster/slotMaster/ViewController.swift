//
//  ViewController.swift
//  slotMaster
//
//  Created by user223323 on 11/1/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var centreImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var totalPointsLabel: UILabel!
    
    let imageNames: [String] = ["cherries", "number7", "dollarsign", "lemon", "grapes"]
    
    var points: Int = 0
    
    @IBAction func playButtonHit(_ sender: Any) {
        let im1 = imageNames.randomElement()
        let im2 = imageNames.randomElement()
        let im3 = imageNames.randomElement()
        
        if let imageName1 = im1,
           let imageName2 = im2,
           let imageName3 = im3 {
            leftImageView.image = UIImage(named: imageName1)
            centreImageView.image = UIImage(named: imageName2)
            rightImageView.image = UIImage(named: imageName3)
            
            if imageName1 == imageName2 && imageName2 == imageName3{
                points += 5
            } else if imageName1 == imageName2 || imageName2 == imageName3 || imageName3 == imageName1{
                points += 2
            }
            totalPointsLabel.text = "Total Points: \(points)"
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

