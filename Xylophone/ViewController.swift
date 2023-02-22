//
//  ViewController.swift
//  Xylophone
//
//  Created by Emre Sahin on 22.02.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func soundButton(_ sender: UIButton) {
        sender.alpha = 0.5
        playSound(buttonName: sender.currentTitle!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            sender.alpha = 1.0
        }
    
    }
    
    func playSound(buttonName: String) {
        guard let url = Bundle.main.url(forResource: buttonName, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

