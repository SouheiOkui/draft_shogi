//
//  ViewController.swift
//  SyoGi_HERO
//
//  Created by nttr on 2017/08/02.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib. 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func start(){
        var soundIdRing:SystemSoundID = 0
        if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "dondon", ofType:"mp3")!) as NSURL?{
            AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
            AudioServicesPlaySystemSound(soundIdRing)
        }
        self.performSegue(withIdentifier: "one", sender: nil)
    }


}

