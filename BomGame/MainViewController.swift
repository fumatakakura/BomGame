//
//  MainViewController.swift
//  BomGame
//
//  Created by 高倉楓麻 on 2019/12/04.
//  Copyright © 2019 高倉楓麻. All rights reserved.
//

import UIKit
import AVFoundation


class MainViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
//    var iValue = Int.random(in: 1 ... 30)
    var iValue = 3
    
    
    var bomb: [UIImage] = []
    var bomb1: [UIImage] = []
    
    var player: AVAudioPlayer!
    var player1: AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "bomb-0")
        print(iValue)

        bomb = createImageArray(total: 35, imagePrefix: "bomb")
        bomb1 = createImageArray(total: 70, imagePrefix: "explosion")
        
        //正解音
        let audioPath = Bundle.main.path(forResource: "seikai", ofType: "mp3")
        let audioUrl = URL(fileURLWithPath: audioPath!)
        player = try! AVAudioPlayer(contentsOf: audioUrl)
        player.prepareToPlay()
        
        //爆発音
        let audioPath1 = Bundle.main.path(forResource: "bakuhatu", ofType: "mp3")
        let audioUrl1 = URL(fileURLWithPath: audioPath1!)
        player1 = try! AVAudioPlayer(contentsOf: audioUrl1)
        player1.prepareToPlay()
        
    }
    
    //画像を配列に格納
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        var imageArray: [UIImage] = []
        
        for imageCount in 1..<total {
            let imageName = "\(imagePrefix)-\(imageCount)"
            let Image = UIImage(named: imageName)!
            
            imageArray.append(Image)
        }
        return imageArray
    }
    
    func animate (imageView: UIImageView, images: [UIImage]){
        imageView.animationImages = images
        imageView.animationDuration = 2
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }
    
    
    
    @IBAction func didClickButton(_ sender: UIButton) {
        iValue -= 1
        print(iValue)
        
        if iValue == 0 {
            button.isEnabled = false
            animate(imageView: imageView, images: bomb1)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.player1.play()
                    self.performSegue(withIdentifier: "toHome", sender: nil)
            }
        } else {
            button.isEnabled = false
            animate(imageView: imageView, images: bomb)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                self.player.play()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.button.isEnabled = true
                }
            }
        }
    }
    
}

extension ViewController: AVAudioPlayerDelegate {}

