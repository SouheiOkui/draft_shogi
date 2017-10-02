//
//  HeroChoseViewController.swift
//  SyoGi_HERO
//
//  Created by Souhei okui on 2017/09/03.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit
import AudioToolbox

class HeroChoseViewController: UIViewController {
    var boardMatrix:[[Int]] = [[0,0,0],[0,0,0],[1,1,1],[0,0,0],[0,0,0],[-1,-1,-1],[0,0,0],[0,0,0]]
    var possibleMatrix:[[Int]] = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
    var impossibleCell:Int = 0
    var komaImageIndex:[String] = ["hu.png","king.png","gold.png","silva.png","hose.png","kyo.png","to.png","tama.png"]
    let komaCostIndex = [ "2" : 4,
                          "3" : 2,
                          "4" : 1,
                          "5" : 1,
                          "6" : 2,
                          "8" : 4,
                          "12" : 4,
                          "14" : 3,
                          "16" : 1]
    var maxCost : Int = 9
    var chousingKoma : Int = 0
    var chousingCost : Int = 0
    
    @IBOutlet var label : UILabel!
    @IBOutlet var next1 : UIButton!
    @IBOutlet var next2 : UIImageView!
    
    @IBOutlet var komaImg1 : UIImageView!
    @IBOutlet var komaImg2 : UIImageView!
    @IBOutlet var komaImg3 : UIImageView!
    @IBOutlet var komaImg4 : UIImageView!
    @IBOutlet var komaImg5 : UIImageView!
    @IBOutlet var komaImg6 : UIImageView!
    
    @IBOutlet var buttns1 : UIButton!
    @IBOutlet var buttns2 : UIButton!
    @IBOutlet var buttns3 : UIButton!
    @IBOutlet var buttns4 : UIButton!
    @IBOutlet var buttns5 : UIButton!
    @IBOutlet var buttns6 : UIButton!
    
    @IBOutlet var komaButtns1 : UIButton!
    @IBOutlet var komaButtns2 : UIButton!
    @IBOutlet var komaButtns3 : UIButton!
    @IBOutlet var komaButtns4 : UIButton!
    @IBOutlet var komaButtns5 : UIButton!
    @IBOutlet var komaButtns6 : UIButton!
       
    override func viewDidLoad() {
        super.viewDidLoad()
        protAlpha()
        next1.alpha = 0
        next2.alpha = 0
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func chouse(komaNo : Int){
        chousingKoma = komaNo
        chousingCost = komaCostIndex[String(komaNo)]!
        var count : Int = 0
        var totalCost : Int = 0
        for x in 1...6{
            if boardMatrix [(x-1) / 3][(x-1) % 3] != 0 {
                print(boardMatrix [(x-1) / 3][(x-1) % 3])
                count=count+1
                totalCost=totalCost+komaCostIndex[String(boardMatrix [(x-1) / 3][(x-1) % 3])]!
            }
        }
        if count < 1 && totalCost + komaCostIndex[String(chousingKoma)]! <= maxCost{
            protRed()
            var soundIdRing:SystemSoundID = 0
            if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "cursor", ofType:"mp3")!) as NSURL?{
                AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
                AudioServicesPlaySystemSound(soundIdRing)
            }
        }
    }
    
    
    func tap(cell_No : Int){
        var count : Int = 0
        var totalCost : Int = 0
        
        
        for x in 1...6{
            if boardMatrix [(x-1) / 3][(x-1) % 3] != 0 {
                print(boardMatrix [(x-1) / 3][(x-1) % 3])
                count=count+1
                totalCost=totalCost+komaCostIndex[String(boardMatrix [(x-1) / 3][(x-1) % 3])]!
            }
        }
        print("カウント"+String(count))
        print("コスト"+String(totalCost))
        
        if chousingKoma != 0 && count < 3 && totalCost + komaCostIndex[String(chousingKoma)]! <= maxCost{
            boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3] = chousingKoma
            impossibleCell = cell_No
            var soundIdRing:SystemSoundID = 0
            if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "don", ofType:"mp3")!) as NSURL?{
                AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
                AudioServicesPlaySystemSound(soundIdRing)
            }

        }
        else if chousingKoma == 0{
            boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3] = 0
            if impossibleCell == cell_No{
                var soundIdRing:SystemSoundID = 0
                if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "remove", ofType:"mp3")!) as NSURL?{
                    AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
                    AudioServicesPlaySystemSound(soundIdRing)
                }
            }
        }
        totalCost = 0
        for x in 1...6{
            if boardMatrix [(x-1) / 3][(x-1) % 3] != 0 {
                print(boardMatrix [(x-1) / 3][(x-1) % 3])
                totalCost=totalCost+komaCostIndex[String(boardMatrix [(x-1) / 3][(x-1) % 3])]!
            }
        }
        label.text = String(totalCost) + "/9"
        if totalCost > 0{
            next1.alpha = 1
            next2.alpha = 1
        }
        else if totalCost == 0{
            next1.alpha = 0
            next2.alpha = 0
        }
        plotKoma()
        protClear()
        protUpClear()
        chousingKoma = 0
    }
    func protAlpha(){
        buttns1.alpha = 0.5
        buttns2.alpha = 0.5
        buttns3.alpha = 0.5
        buttns4.alpha = 0.5
        buttns5.alpha = 0.5
        buttns6.alpha = 0.5
        komaButtns1.alpha = 0.5
        komaButtns2.alpha = 0.5
        komaButtns3.alpha = 0.5
        komaButtns4.alpha = 0.5
        komaButtns5.alpha = 0.5
        komaButtns6.alpha = 0.5
    }
    func protRed(){
        if boardMatrix[0][0] == 0 {buttns1.backgroundColor = UIColor.red}else{buttns1.backgroundColor = UIColor.brown}
        if boardMatrix[0][1] == 0 {buttns2.backgroundColor = UIColor.red}else{buttns2.backgroundColor = UIColor.brown}
        if boardMatrix[0][2] == 0 {buttns3.backgroundColor = UIColor.red}else{buttns3.backgroundColor = UIColor.brown}
        if boardMatrix[1][0] == 0 {buttns4.backgroundColor = UIColor.red}else{buttns4.backgroundColor = UIColor.brown}
        if boardMatrix[1][1] == 0 {buttns5.backgroundColor = UIColor.red}else{buttns5.backgroundColor = UIColor.brown}
        if boardMatrix[1][2] == 0 {buttns6.backgroundColor = UIColor.red}else{buttns6.backgroundColor = UIColor.brown}
    }
    func protClear(){
        buttns1.backgroundColor = UIColor.brown
        buttns2.backgroundColor = UIColor.brown
        buttns3.backgroundColor = UIColor.brown
        buttns4.backgroundColor = UIColor.brown
        buttns5.backgroundColor = UIColor.brown
        buttns6.backgroundColor = UIColor.brown
    }
    func protUpClear(){
        komaButtns1.backgroundColor = UIColor.black
        komaButtns2.backgroundColor = UIColor.black
        komaButtns3.backgroundColor = UIColor.black
        komaButtns4.backgroundColor = UIColor.black
        komaButtns5.backgroundColor = UIColor.black
        komaButtns6.backgroundColor = UIColor.black
    }
    func plotKoma(){//駒の画像をプロット
        for x in 0...8{//駒が追加されたらこのfar文も長くする
            if boardMatrix[0][0] >= 1 && boardMatrix[0][0] == x+1 {
                komaImg1.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[0][0] == 0 {komaImg1.image = UIImage(named : "koma2.png")}
            if boardMatrix[0][1] >= 1 && boardMatrix[0][1] == x+1 {
                komaImg2.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[0][1] == 0 {komaImg2.image = UIImage(named : "koma2.png")}
            if boardMatrix[0][2] >= 1 && boardMatrix[0][2] == x+1 {
                komaImg3.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[0][2] == 0 {komaImg3.image = UIImage(named : "koma2.png")}
            //----
            if boardMatrix[1][0] >= 1 && boardMatrix[1][0] == x+1 {
                komaImg4.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[1][0] == 0 {komaImg4.image = UIImage(named : "koma2.png")}
            if boardMatrix[1][1] >= 1 && boardMatrix[1][1] == x+1 {
                komaImg5.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[1][1] == 0 {komaImg5.image = UIImage(named : "koma2.png")}
            if boardMatrix[1][2] >= 1 && boardMatrix[1][2] == x+1 {
                komaImg6.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[1][2] == 0 {komaImg6.image = UIImage(named : "koma2.png")}
            //---
        }
    }
    
    @IBAction func tap1(){
        tap(cell_No: 1)
    }
    @IBAction func tap2(){
        tap(cell_No: 2)
    }
    @IBAction func tap3(){
        tap(cell_No: 3)
    }
    @IBAction func tap4(){
        tap(cell_No: 4)
    }
    @IBAction func tap5(){
        tap(cell_No: 5)
    }
    @IBAction func tap6(){
        tap(cell_No: 6)
    }
    
    @IBAction func chose1(){
        protUpClear()
        komaButtns1.backgroundColor = UIColor.red
        chouse(komaNo: 2)
    }
    @IBAction func chose2(){
        protUpClear()
        komaButtns2.backgroundColor = UIColor.red
        chouse(komaNo: 8)
    }
    @IBAction func chose3(){
        protUpClear()
        komaButtns3.backgroundColor = UIColor.red
        chouse(komaNo: 4)
    }
    @IBAction func chose4(){
        protUpClear()
        komaButtns4.backgroundColor = UIColor.red
        chouse(komaNo: 5)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chose" {
            var soundIdRing:SystemSoundID = 0
            if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "dondon", ofType:"mp3")!) as NSURL?{
                AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
                AudioServicesPlaySystemSound(soundIdRing)
            }
            let choseViewController = segue.destination as! ChoseViewController
            choseViewController.boardMatrix = boardMatrix
            choseViewController.impossibleCell = impossibleCell
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
