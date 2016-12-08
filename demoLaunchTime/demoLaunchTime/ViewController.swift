//
//  ViewController.swift
//  demoLaunchTime
//
//  Created by Anson Yao on 2016-12-01.
//  Copyright © 2016 Anson Yao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var images = [UIImage(named: "1.jpg"), UIImage(named: "2.jpg"), UIImage(named: "3.jpg"), UIImage(named: "4.jpg"), UIImage(named: "5.jpg")]
    var index = 0
    var timer = Timer()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            self.updateImage()
        })

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timer.fire()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    deinit {
        timer.invalidate()
    }
    
    func updateImage() {
        DispatchQueue.main.async {
            self.imageView.image = self.images[self.index]
            self.index += 1
            if self.index >= self.images.count {
                self.index = 0
            }
        }
    }
}

