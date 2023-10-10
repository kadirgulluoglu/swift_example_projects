//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        imageView.image = UIImage(named: "ball3")
        
    }
    

    let ballArray = ["ball1.png","ball2.png","ball3.png","ball4.png","ball5.png",]
    
  
    @IBAction func askButton(_ sender: UIButton) {
        imageView.image = UIImage(named: ballArray[Int.random(in: 0...4)])
    }
    
}

