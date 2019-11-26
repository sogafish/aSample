//
//  ViewController.swift
//  aSample
//
//  Created by k.soga on 2019/11/25.
//  Copyright © 2019 k.soga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func fadeoutAndRemove(_ view: UIView) {
        UIView.animate(
            withDuration: 2.0,
            delay: 1.0,
            animations: {
                view.alpha = 0.0
            },
            completion: {(finished: Bool) in
                view.removeFromSuperview()
            }
        )
    }

    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        let fish = UIImageView(image: UIImage(named: "fish"))
        print(fish)
        fish.alpha = 0
        
        let schaleTransform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        let rotationTransform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        
        let newTransform = schaleTransform.concatenating(rotationTransform)
        fish.transform = newTransform
        
        fish.center = sender.location(in: self.view)
        self.view.addSubview(fish)
        
        UIView.animate(
            withDuration: 3.0,
            delay: 0,
            options: [.curveEaseInOut, .repeat],
            animations: {
                fish.alpha = 1.0
                fish.transform = .identity
            },
            completion: {(finished: Bool) in
                self.fadeoutAndRemove(fish)
            }
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

