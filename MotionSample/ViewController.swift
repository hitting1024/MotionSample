//
//  ViewController.swift
//  MotionSample
//
//  Created by hitting on 2018/06/08.
//  Copyright © 2018年 Hit Apps. All rights reserved.
//

import UIKit

import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    @IBOutlet weak var gyroXLabel: UILabel!
    @IBOutlet weak var gyroYLabel: UILabel!
    @IBOutlet weak var gyroZLabel: UILabel!
    
    private let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if self.motionManager.isAccelerometerAvailable {
            self.motionManager.accelerometerUpdateInterval = 0.1
            self.motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: { [weak self] (data, error) in
                guard let `self` = self, let data = data else { return }
                self.xLabel.text = "\(data.acceleration.x)"
                self.yLabel.text = "\(data.acceleration.y)"
                self.zLabel.text = "\(data.acceleration.z)"
            })
        } else {
            self.xLabel.text = "Not Supported"
        }
        
        if self.motionManager.isGyroAvailable {
            self.motionManager.gyroUpdateInterval = 0.1
            self.motionManager.startGyroUpdates(to: OperationQueue.current!, withHandler: { [weak self] (data, error) in
                guard let `self` = self, let data = data else { return }
                self.gyroXLabel.text = "\(data.rotationRate.x)"
                self.gyroYLabel.text = "\(data.rotationRate.y)"
                self.gyroZLabel.text = "\(data.rotationRate.z)"
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

