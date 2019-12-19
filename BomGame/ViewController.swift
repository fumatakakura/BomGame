//
//  ViewController.swift
//  BomGame
//
//  Created by 高倉楓麻 on 2019/12/04.
//  Copyright © 2019 高倉楓麻. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let playButtonSize = CGSize(width: 100, height: 100)
        
        let playButtonX = UIScreen.main.bounds.size.width * 0.4
        let playButtonY = UIScreen.main.bounds.size.height * 0.4
        
        playButton.frame = CGRect(origin: CGPoint(x: playButtonX, y: playButtonY), size: playButtonSize)
        
    }
    
    @IBAction func didClickButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toNext", sender: nil)
    }
    

}

