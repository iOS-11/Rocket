//
//  ViewController.swift
//  Hustle
//
//  Created by Abdurrahman on 10/8/17.
//  Copyright © 2017 AR Ehsan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

	@IBOutlet weak var statusLabel: UILabel!
	@IBOutlet weak var powerButton: UIButton!
	@IBOutlet weak var rocketshipImage: UIImageView!
	
	var player: AVAudioPlayer!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let path = Bundle.main.path(forResource: "takeoff", ofType: "wav")!
		let url = URL(fileURLWithPath: path)
		
		do {
			player = try AVAudioPlayer(contentsOf: url)
			player.prepareToPlay()
		} catch let err as NSError {
			print(err.description)
		}

		statusLabel.text = "Space"
	}

	@IBAction func powerButtonPressed(_ sender: Any) {
		powerButton.isHidden = true
		rocketshipImage.isHidden = false
		
		player.play()
		
		UIView.animate(withDuration: 2.5, animations: {
			self.rocketshipImage.frame = CGRect(x: 94, y: -400, width: 187, height: 350)
		}) { (finished) in
			self.statusLabel.text = "Launched!"
		}
	}
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

}

