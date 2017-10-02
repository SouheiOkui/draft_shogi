//
//  ButtleViewController.swift
//  SyoGi_HERO
//
//  Created by nttr on 2017/08/14.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit
import AudioToolbox

class ButtleViewController: UIViewController {
    var koma_No : Int = 0
    var chatchFlag : Bool = true
    var boardMatrix:[[Int]] = [[0,2,0],[0,0,0],[1,1,1],[0,0,0],[0,0,0],[-1,-1,-1],[0,0,0],[0,-2,0]]
    var possibleMatrix:[[Int]] = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
    var possibleP2Matrix:[[Int]] = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
    var possiblePutMatrix:[[Int]] = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
    var possibleP2PutMatrix:[[Int]] = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
    var lastCallX : Int = -1
    var lastCallY : Int = -1
    var play1Hold : [Int] = [0,0,0,0,0]
    var play2Hold : [Int] = [0,0,0,0,0]
    var putNumber : [Int] = [0,0]
    var finishFlag : String = ""
    var turn : Bool = true
    var soundFlag : Int = 0
    var unFlag : Int = 0
    var unNum : Int = 5
    var evolveFlag : Int = 0
    
    var komaImageIndex:[String] = ["hu.png","kingRed.png","gold.png","silva.png","hose.png","kyo.png","to.png","tamaRed.png","gold.png","gold.png","gold.png","wing.png","dolagoKing.png","kaku.png","dolagoHose.png","cat.png","tiger.png","un.png"]
    var r_komaImageIndex:[String] = ["r_hu.png","r_king.png","r_gold.png","r_silva.png","r_hose.png","r_kyo.png","r_to.png","r_tama.png","r_gold.png","r_gold.png","r_gold.png","r_wing.png","r_dolagoKing.png","r_kaku.png","r_dolagoHose.png","r_cat.png","r_tiger.png","r_un.png"]
    var komaKazu : Int = 18
    
    var degenerationIndex :[Int] = [0,1,2,3,4,5,6,1,8,4,5,6,12,12,14,14,16,16,18]
    
    @IBOutlet var redTobiraImageView: UIImageView!
    @IBOutlet var blueTobiraImageView : UIImageView!

    @IBOutlet var startButtns : UIButton!
    @IBOutlet var tobira1 : UIImageView!
    @IBOutlet var tobira2 : UIImageView!
    
    @IBOutlet var buttns1 : UIButton!
    @IBOutlet var buttns2 : UIButton!
    @IBOutlet var buttns3 : UIButton!
    @IBOutlet var buttns4 : UIButton!
    @IBOutlet var buttns5 : UIButton!
    @IBOutlet var buttns6 : UIButton!
    @IBOutlet var buttns7 : UIButton!
    @IBOutlet var buttns8 : UIButton!
    @IBOutlet var buttns9 : UIButton!
    @IBOutlet var buttns10 : UIButton!
    @IBOutlet var buttns11 : UIButton!
    @IBOutlet var buttns12 : UIButton!
    @IBOutlet var buttns13 : UIButton!
    @IBOutlet var buttns14 : UIButton!
    @IBOutlet var buttns15 : UIButton!
    @IBOutlet var buttns16 : UIButton!
    @IBOutlet var buttns17 : UIButton!
    @IBOutlet var buttns18 : UIButton!
    @IBOutlet var buttns19 : UIButton!
    @IBOutlet var buttns20 : UIButton!
    @IBOutlet var buttns21 : UIButton!
    @IBOutlet var buttns22 : UIButton!
    @IBOutlet var buttns23 : UIButton!
    @IBOutlet var buttns24 : UIButton!
    
    @IBOutlet var handButtns1 : UIButton!
    @IBOutlet var handButtns2 : UIButton!
    @IBOutlet var handButtns3 : UIButton!
    @IBOutlet var handButtns4 : UIButton!
    @IBOutlet var handButtns5 : UIButton!
    @IBOutlet var handButtns6 : UIButton!
    @IBOutlet var handButtns7 : UIButton!
    @IBOutlet var handButtns8 : UIButton!
    
    @IBOutlet var komaImg1 : UIImageView!
    @IBOutlet var komaImg2 : UIImageView!
    @IBOutlet var komaImg3 : UIImageView!
    @IBOutlet var komaImg4 : UIImageView!
    @IBOutlet var komaImg5 : UIImageView!
    @IBOutlet var komaImg6 : UIImageView!
    @IBOutlet var komaImg7 : UIImageView!
    @IBOutlet var komaImg8 : UIImageView!
    @IBOutlet var komaImg9 : UIImageView!
    @IBOutlet var komaImg10 : UIImageView!
    @IBOutlet var komaImg11 : UIImageView!
    @IBOutlet var komaImg12 : UIImageView!
    @IBOutlet var komaImg13 : UIImageView!
    @IBOutlet var komaImg14 : UIImageView!
    @IBOutlet var komaImg15 : UIImageView!
    @IBOutlet var komaImg16 : UIImageView!
    @IBOutlet var komaImg17 : UIImageView!
    @IBOutlet var komaImg18 : UIImageView!
    @IBOutlet var komaImg19 : UIImageView!
    @IBOutlet var komaImg20 : UIImageView!
    @IBOutlet var komaImg21 : UIImageView!
    @IBOutlet var komaImg22 : UIImageView!
    @IBOutlet var komaImg23 : UIImageView!
    @IBOutlet var komaImg24 : UIImageView!
    
    @IBOutlet var handKomaImg1 : UIImageView!
    @IBOutlet var handKomaImg2 : UIImageView!
    @IBOutlet var handKomaImg3 : UIImageView!
    @IBOutlet var handKomaImg4 : UIImageView!
    @IBOutlet var handKomaImg5 : UIImageView!
    @IBOutlet var handKomaImg6 : UIImageView!
    @IBOutlet var handKomaImg7 : UIImageView!
    @IBOutlet var handKomaImg8 : UIImageView!
    @IBOutlet var holdingHu1 : UILabel!
    @IBOutlet var holdingHu2 : UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        plot(boardMatrix: boardMatrix)
        plotKoma()
        protAlpha()
        let random = (Int)(arc4random_uniform(UInt32(unNum)))
        unFlag = random
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func tap(cell_No : Int){
        protHandClear()
        allClear()
        chatchFlag = true
        print("cell : "+String(cell_No))
        koma_No = boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3]
        print("koma : "+String(koma_No))
        
        print(possibleMatrix)
        print(possibleP2Matrix)
        print((cell_No-1) / 3)
        print((cell_No-1) % 3)
        print()
        print(lastCallX)
        print(lastCallY)
        var soundIdRing:SystemSoundID = 0
        
        
        if possibleMatrix[(cell_No-1) / 3][(cell_No-1) % 3] == 1 && turn == true{//赤いセルを押した時
            soundFlag = 1
            if boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3] < 0{
                soundFlag = 2
                
                if (boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3] == -2) || (boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3] == -8){
                    if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "finish", ofType:"mp3")!) as NSURL?{
                        AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
                        AudioServicesPlaySystemSound(soundIdRing)
                    }
                    finishFlag="blue"
                    self.performSegue(withIdentifier: "finish", sender: nil)
                }
                
                handAdd(handNumber : boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3])
            }
            boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3] = boardMatrix[lastCallX][lastCallY]
            boardMatrix[lastCallX][lastCallY]=0
            chatchFlag = false
            plotPossible()
            plotPossible2()
            evolve(cell_No : cell_No)
            turn = false
            let random = (Int)(arc4random_uniform(UInt32(unNum)))
            unFlag = random
        }
        if possibleP2Matrix[(cell_No-1) / 3][(cell_No-1) % 3] == 1 && turn == false{//青いセルを押した時
            soundFlag = 1
            if boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3] > 0{
                soundFlag = 2
                
                if (boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3] == 2) || (boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3] == 8){
                    if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "finish", ofType:"mp3")!) as NSURL?{
                        AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
                        AudioServicesPlaySystemSound(soundIdRing)
                    }
                    finishFlag="red"
                    self.performSegue(withIdentifier: "finish", sender: nil)
                }
                
                handAdd2(handNumber : boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3])
            }
            boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3] = boardMatrix[lastCallX][lastCallY]
            boardMatrix[lastCallX][lastCallY]=0
            chatchFlag = false
            plotPossible2()
            plotPossible()
            evolve2(cell_No : cell_No)
            turn = true
            let random = (Int)(arc4random_uniform(UInt32(unNum)))
            unFlag = random
        }
        
        if possiblePutMatrix[(cell_No-1) / 3][(cell_No-1) % 3] == 1 && turn == true{//putの赤いセルを押した時
            boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3] = putNumber[0]
            if putNumber[0] == 1{
                play1Hold[4] = play1Hold[4] - 1
                if play1Hold[4] == 0{
                    play1Hold[putNumber[1]] = 0
                }
            }
            else if putNumber[0] != 1{play1Hold[putNumber[1]] = 0}
            soundFlag = 1
            turn = false
            let random = (Int)(arc4random_uniform(UInt32(unNum)))
            unFlag = random
        }
        if possibleP2PutMatrix[(cell_No-1) / 3][(cell_No-1) % 3] == 1 && turn == false{//putの青セルを押した時
            boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3] = putNumber[0] * -1
            if putNumber[0] == 1{
                play2Hold[4] = play2Hold[4] - 1
                if play2Hold[4] == 0{
                    play2Hold[putNumber[1]] = 0
                }
            }
            else if putNumber[0] != 1{play2Hold[putNumber[1]] = 0}
            soundFlag = 1
            turn = true
            let random = (Int)(arc4random_uniform(UInt32(unNum)))
            unFlag = random
        }
        
        possibleMatrix = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
        possibleP2Matrix = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
        possiblePutMatrix = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
        possibleP2PutMatrix = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
        lastCallX = -1
        lastCallY = -1
        
        if koma_No == 1 && chatchFlag && turn == true{
            print("歩だよ")
            callHu(cell_No:cell_No)
            plotPossible()
            soundFlag = 3
        }
        if koma_No == -1 && chatchFlag && turn == false{
            print("敵の歩だよ")
            callHuR(cell_No:cell_No)
            plotPossible2()
            soundFlag = 3
        }
        if (koma_No == 2 || koma_No == 8) && chatchFlag && turn == true{
            print("キングだよ")
            callKing(cell_No:cell_No)
            plotPossible()
            soundFlag = 3
        }
        if (koma_No == -2 || koma_No == -8) && chatchFlag && turn == false{
            print("敵のキングだよ")
            callKingR(cell_No:cell_No)
            plotPossible2()
            soundFlag = 3
        }
        if (koma_No == 3 || koma_No == 7 || (koma_No >= 9 && koma_No <= 11)) && chatchFlag && turn == true{
            print("金だよ")
            callGold(cell_No:cell_No)
            plotPossible()
            soundFlag = 3
        }
        if (koma_No == -3 || koma_No == -7 || (koma_No >= -11 && koma_No <= -9)) && chatchFlag && turn == false{
            print("敵の金だよ")
            callGoldR(cell_No:cell_No)
            plotPossible2()
            soundFlag = 3
        }
        if koma_No == 4 && chatchFlag && turn == true{
            print("銀だよ")
            callSilva(cell_No:cell_No)
            plotPossible()
            soundFlag = 3
        }
        if koma_No == -4 && chatchFlag && turn == false{
            print("敵の銀だよ")
            callSilvaR(cell_No:cell_No)
            plotPossible2()
            soundFlag = 3
        }
        if koma_No == 5 && chatchFlag && turn == true{
            print("馬だよ")
            callHose(cell_No:cell_No)
            plotPossible()
            soundFlag = 3
        }
        if koma_No == -5 && chatchFlag && turn == false{
            print("敵の馬だよ")
            callHoseR(cell_No:cell_No)
            plotPossible2()
            soundFlag = 3
        }
        if koma_No == 6 && chatchFlag && turn == true{
            print("香だよ")
            callKyo(cell_No:cell_No)
            plotPossible()
            soundFlag = 3
        }
        if koma_No == -6 && chatchFlag && turn == false{
            print("敵の香だよ")
            callKyoR(cell_No:cell_No)
            plotPossible2()
            soundFlag = 3
        }
        if koma_No == 12 && chatchFlag && turn == true{
            print("飛車だよ")
            callWing(cell_No:cell_No)
            plotPossible()
            soundFlag = 3
        }
        if koma_No == -12 && chatchFlag && turn == false{
            print("敵の飛車だよ")
            callWingR(cell_No:cell_No)
            plotPossible2()
            soundFlag = 3
        }
        if koma_No == 13 && chatchFlag && turn == true{
            print("竜王だよ")
            calldragonKing(cell_No:cell_No)
            plotPossible()
            soundFlag = 3
        }
        if koma_No == -13 && chatchFlag && turn == false{
            print("敵の竜王だよ")
            calldragonKingR(cell_No:cell_No)
            plotPossible2()
            soundFlag = 3
        }
        if koma_No == 14 && chatchFlag && turn == true{
            print("角だよ")
            callKaku(cell_No:cell_No)
            plotPossible()
            soundFlag = 3
        }
        if koma_No == -14 && chatchFlag && turn == false{
            print("敵の角だよ")
            callKakuR(cell_No:cell_No)
            plotPossible2()
            soundFlag = 3
        }
        if koma_No == 15 && chatchFlag && turn == true{
            print("竜馬だよ")
            callDragonHose(cell_No:cell_No)
            plotPossible()
            soundFlag = 3
        }
        if koma_No == -15 && chatchFlag && turn == false{
            print("敵の竜馬だよ")
            callDragonHoseR(cell_No:cell_No)
            plotPossible2()
            soundFlag = 3
        }
        if koma_No == 16 && chatchFlag && turn == true{
            print("猫だよ")
            callCat(cell_No:cell_No)
            plotPossible()
            soundFlag = 4
        }
        if koma_No == -16 && chatchFlag && turn == false{
            print("敵の猫だよ")
            callCatR(cell_No:cell_No)
            plotPossible2()
            soundFlag = 4
        }
        if koma_No == 17 && chatchFlag && turn == true{
            print("とらだよ")
            callTiger(cell_No:cell_No)
            plotPossible()
            soundFlag = 3
        }
        if koma_No == -17 && chatchFlag && turn == false{
            print("敵のとらだよ")
            callTigerR(cell_No:cell_No)
            plotPossible2()
            soundFlag = 3
        }
        if koma_No == 18 && chatchFlag && turn == true{
            print("運だよ")
            print(unFlag)
            if unFlag == 0 {callHu(cell_No:cell_No)}
            if unFlag == 1 {callKing(cell_No:cell_No)}
            if unFlag == 2 {callKyo(cell_No:cell_No)}
            if unFlag == 3 {callHose(cell_No:cell_No)}
            if unFlag == 4 {calldragonKing(cell_No:cell_No)}
            plotPossible()
            soundFlag = 3
        }
        if koma_No == -18 && chatchFlag && turn == false{
            print("敵の運だよ")
            print(unFlag)
            if unFlag == 0 {callHuR(cell_No:cell_No)}
            if unFlag == 1 {callKingR(cell_No:cell_No)}
            if unFlag == 2 {callKyoR(cell_No:cell_No)}
            if unFlag == 3 {callHoseR(cell_No:cell_No)}
            if unFlag == 4 {calldragonKingR(cell_No:cell_No)}
            plotPossible2()
            soundFlag = 3
        }

        if soundFlag == 0 {
            if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "bi", ofType:"mp3")!) as NSURL?{
                AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
                AudioServicesPlaySystemSound(soundIdRing)
            }
            soundFlag = 0
        }
        else if soundFlag == 1 {
            if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "don", ofType:"mp3")!) as NSURL?{
                AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
                AudioServicesPlaySystemSound(soundIdRing)
            }
            soundFlag = 0
        }
        else if soundFlag == 2 {
            if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "dondon", ofType:"mp3")!) as NSURL?{
                AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
                AudioServicesPlaySystemSound(soundIdRing)
            }
            soundFlag = 0
        }
        else if soundFlag == 3 {
            if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "cursor", ofType:"mp3")!) as NSURL?{
                AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
                AudioServicesPlaySystemSound(soundIdRing)
            }
            soundFlag = 0
        }
        else if soundFlag == 4 {
            if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "neko", ofType:"mp3")!) as NSURL?{
                AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
                AudioServicesPlaySystemSound(soundIdRing)
            }
            soundFlag = 0
        }
        
        
        print(possibleMatrix)
        plotHandKoma()
        plotHandKoma2()
        plotKoma()
        
    }
    
    func plot(boardMatrix:[[Int]]){
        for x in boardMatrix{
            for y in x{
                print(String(y)+" ")
            }
            print("¥n")
        }
    }
    
    //ここから雑--------
    
    func callHu(cell_No : Int){
        if  ((cell_No-1) / 3) + 1 < 8{
            if  boardMatrix[((cell_No-1) / 3) + 1][(cell_No-1) % 3] <= 0 {
                possibleMatrix [((cell_No-1) / 3) + 1][(cell_No-1) % 3] = 1
                lastCallX = ((cell_No-1) / 3)
                lastCallY = (cell_No-1) % 3
            }
        }
    }
    func callHuR(cell_No : Int){
        if  ((cell_No-1) / 3) + 1 > 1{
            if  boardMatrix[((cell_No-1) / 3) - 1][(cell_No-1) % 3] >= 0 {
                possibleP2Matrix [((cell_No-1) / 3) - 1][(cell_No-1) % 3] = 1
                lastCallX = ((cell_No-1) / 3)
                lastCallY = (cell_No-1) % 3
            }
        }
    }
    func callKing(cell_No : Int){
        if  4 < cell_No && cell_No < 22 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[(cell_No-3)/3][0] <= 0 {possibleMatrix [(cell_No-3)/3][0] = 1}
            if  boardMatrix[(cell_No-3)/3][1] <= 0 {possibleMatrix [(cell_No-3)/3][1] = 1}
            if  boardMatrix[(cell_No-3)/3][2] <= 0 {possibleMatrix [(cell_No-3)/3][2] = 1}
            if  boardMatrix[(cell_No)/3][0] <= 0 {possibleMatrix [(cell_No)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][2] <= 0 {possibleMatrix [(cell_No)/3][2] = 1}
            if  boardMatrix[(cell_No+3)/3][0] <= 0 {possibleMatrix [(cell_No+3)/3][0] = 1}
            if  boardMatrix[(cell_No+3)/3][1] <= 0 {possibleMatrix [(cell_No+3)/3][1] = 1}
            if  boardMatrix[(cell_No+3)/3][2] <= 0 {possibleMatrix [(cell_No+3)/3][2] = 1}
        }
        else if  4 < cell_No && cell_No < 22 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No-4)/3][1] <= 0 {possibleMatrix [(cell_No-4)/3][1] = 1}
            if  boardMatrix[(cell_No-4)/3][2] <= 0 {possibleMatrix [(cell_No-4)/3][2] = 1}
            if  boardMatrix[(cell_No-1)/3][1] <= 0 {possibleMatrix [(cell_No-1)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][1] <= 0 {possibleMatrix [(cell_No+2)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][2] <= 0 {possibleMatrix [(cell_No+2)/3][2] = 1}
        }
        else if  3 < cell_No && cell_No < 22 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No-2)/3][0] <= 0 {possibleMatrix [(cell_No-2)/3][0] = 1}
            if  boardMatrix[(cell_No-2)/3][1] <= 0 {possibleMatrix [(cell_No-2)/3][1] = 1}
            if  boardMatrix[(cell_No)/3][1] <= 0 {possibleMatrix [(cell_No)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][0] <= 0 {possibleMatrix [(cell_No+2)/3][0] = 1}
            if  boardMatrix[(cell_No+2)/3][1] <= 0 {possibleMatrix [(cell_No+2)/3][1] = 1}
        }
        else if cell_No == 2 {
            print("初期値")
            if  boardMatrix[0][0] <= 0 { possibleMatrix [0][0] = 1}
            if  boardMatrix[0][2] <= 0 { possibleMatrix [0][2] = 1}
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
        }
        else if cell_No == 23 {
            if  boardMatrix[7][0] <= 0 { possibleMatrix [7][0] = 1}
            if  boardMatrix[7][2] <= 0 { possibleMatrix [7][2] = 1}
            if  boardMatrix[6][0] <= 0 { possibleMatrix [6][0] = 1}
            if  boardMatrix[6][1] <= 0 { possibleMatrix [6][1] = 1}
            if  boardMatrix[6][2] <= 0 { possibleMatrix [6][2] = 1}
        }
        else if cell_No == 1 {//王のかど
            if  boardMatrix[0][1] <= 0 { possibleMatrix [0][1] = 1}
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
        }
        else if cell_No == 3 {//王のかど
            if  boardMatrix[0][1] <= 0 { possibleMatrix [0][1] = 1}
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
        }
        else if cell_No == 22 {//王のかど
            if  boardMatrix[6][1] <= 0 { possibleMatrix [6][1] = 1}
            if  boardMatrix[6][0] <= 0 { possibleMatrix [6][0] = 1}
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
        }
        else if cell_No == 24 {//王のかど
            if  boardMatrix[6][1] <= 0 { possibleMatrix [6][1] = 1}
            if  boardMatrix[6][2] <= 0 { possibleMatrix [6][2] = 1}
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
        
    }
    func callKingR(cell_No : Int){
        if  4 < cell_No && cell_No < 22 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[(cell_No-3)/3][0] >= 0 {possibleP2Matrix [(cell_No-3)/3][0] = 1}
            if  boardMatrix[(cell_No-3)/3][1] >= 0 {possibleP2Matrix [(cell_No-3)/3][1] = 1}
            if  boardMatrix[(cell_No-3)/3][2] >= 0 {possibleP2Matrix [(cell_No-3)/3][2] = 1}
            if  boardMatrix[(cell_No)/3][0] >= 0 {possibleP2Matrix [(cell_No)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][2] >= 0 {possibleP2Matrix [(cell_No)/3][2] = 1}
            if  boardMatrix[(cell_No+3)/3][0] >= 0 {possibleP2Matrix [(cell_No+3)/3][0] = 1}
            if  boardMatrix[(cell_No+3)/3][1] >= 0 {possibleP2Matrix [(cell_No+3)/3][1] = 1}
            if  boardMatrix[(cell_No+3)/3][2] >= 0 {possibleP2Matrix [(cell_No+3)/3][2] = 1}
        }
        else if  4 < cell_No && cell_No < 22 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No-4)/3][1] >= 0 {possibleP2Matrix [(cell_No-4)/3][1] = 1}
            if  boardMatrix[(cell_No-4)/3][2] >= 0 {possibleP2Matrix [(cell_No-4)/3][2] = 1}
            if  boardMatrix[(cell_No-1)/3][1] >= 0 {possibleP2Matrix [(cell_No-1)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][1] >= 0 {possibleP2Matrix [(cell_No+2)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][2] >= 0 {possibleP2Matrix [(cell_No+2)/3][2] = 1}
        }
        else if  3 < cell_No && cell_No < 22 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No-2)/3][0] >= 0 {possibleP2Matrix [(cell_No-2)/3][0] = 1}
            if  boardMatrix[(cell_No-2)/3][1] >= 0 {possibleP2Matrix [(cell_No-2)/3][1] = 1}
            if  boardMatrix[(cell_No)/3][1] >= 0 {possibleP2Matrix [(cell_No)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][0] >= 0 {possibleP2Matrix [(cell_No+2)/3][0] = 1}
            if  boardMatrix[(cell_No+2)/3][1] >= 0 {possibleP2Matrix [(cell_No+2)/3][1] = 1}
        }
        else if cell_No == 2 {
            print("初期値")
            if  boardMatrix[0][0] >= 0 { possibleP2Matrix [0][0] = 1}
            if  boardMatrix[0][2] >= 0 { possibleP2Matrix [0][2] = 1}
            if  boardMatrix[1][0] >= 0 { possibleP2Matrix [1][0] = 1}
            if  boardMatrix[1][1] >= 0 { possibleP2Matrix [1][1] = 1}
            if  boardMatrix[1][2] >= 0  { possibleP2Matrix [1][2] = 1}
        }
        else if cell_No == 23 {
            if  boardMatrix[7][0] >= 0 { possibleP2Matrix [7][0] = 1}
            if  boardMatrix[7][2] >= 0 { possibleP2Matrix [7][2] = 1}
            if  boardMatrix[6][0] >= 0 { possibleP2Matrix [6][0] = 1}
            if  boardMatrix[6][1] >= 0 { possibleP2Matrix [6][1] = 1}
            if  boardMatrix[6][2] >= 0 { possibleP2Matrix [6][2] = 1}
        }
        else if cell_No == 1 {//王のかど
            if  boardMatrix[0][1] >= 0 { possibleP2Matrix [0][1] = 1}
            if  boardMatrix[1][0] >= 0 { possibleP2Matrix [1][0] = 1}
            if  boardMatrix[1][1] >= 0 { possibleP2Matrix [1][1] = 1}
            
        }
        else if cell_No == 3 {//王のかど
            if  boardMatrix[0][1] >= 0 { possibleP2Matrix [0][1] = 1}
            if  boardMatrix[1][2] >= 0 { possibleP2Matrix [1][2] = 1}
            if  boardMatrix[1][1] >= 0 { possibleP2Matrix [1][1] = 1}
        }
        else if cell_No == 22 {//王のかど
            if  boardMatrix[6][1] >= 0 { possibleP2Matrix [6][1] = 1}
            if  boardMatrix[6][0] >= 0 { possibleP2Matrix [6][0] = 1}
            if  boardMatrix[7][1] >= 0 { possibleP2Matrix [7][1] = 1}
        }
        else if cell_No == 24 {//王のかど
            if  boardMatrix[6][1] >= 0 { possibleP2Matrix [6][1] = 1}
            if  boardMatrix[6][2] >= 0 { possibleP2Matrix [6][2] = 1}
            if  boardMatrix[7][1] >= 0 { possibleP2Matrix [7][1] = 1}
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
    }
    func callGold(cell_No : Int){
        if  4 < cell_No && cell_No < 22 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[(cell_No-3)/3][1] <= 0 {possibleMatrix [(cell_No-3)/3][1] = 1}
            if  boardMatrix[(cell_No)/3][0] <= 0 {possibleMatrix [(cell_No)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][2] <= 0 {possibleMatrix [(cell_No)/3][2] = 1}
            if  boardMatrix[(cell_No+3)/3][0] <= 0 {possibleMatrix [(cell_No+3)/3][0] = 1}
            if  boardMatrix[(cell_No+3)/3][1] <= 0 {possibleMatrix [(cell_No+3)/3][1] = 1}
            if  boardMatrix[(cell_No+3)/3][2] <= 0 {possibleMatrix [(cell_No+3)/3][2] = 1}
        }
        else if  4 < cell_No && cell_No < 22 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No-4)/3][2] <= 0 {possibleMatrix [(cell_No-4)/3][2] = 1}
            if  boardMatrix[(cell_No-1)/3][1] <= 0 {possibleMatrix [(cell_No-1)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][1] <= 0 {possibleMatrix [(cell_No+2)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][2] <= 0 {possibleMatrix [(cell_No+2)/3][2] = 1}
        }
        else if  3 < cell_No && cell_No < 22 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No-2)/3][0] <= 0 {possibleMatrix [(cell_No-2)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][1] <= 0 {possibleMatrix [(cell_No)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][0] <= 0 {possibleMatrix [(cell_No+2)/3][0] = 1}
            if  boardMatrix[(cell_No+2)/3][1] <= 0 {possibleMatrix [(cell_No+2)/3][1] = 1}
        }
        else if cell_No == 2 {
            print("初期値")
            if  boardMatrix[0][0] <= 0 { possibleMatrix [0][0] = 1}
            if  boardMatrix[0][2] <= 0 { possibleMatrix [0][2] = 1}
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
        }
        else if cell_No == 23 {
            if  boardMatrix[7][0] <= 0 { possibleMatrix [7][0] = 1}
            if  boardMatrix[7][2] <= 0 { possibleMatrix [7][2] = 1}
            if  boardMatrix[6][1] <= 0 { possibleMatrix [6][1] = 1}
        }
        else if cell_No == 1 {//金のかど
            if  boardMatrix[0][1] <= 0 { possibleMatrix [0][1] = 1}
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
        }
        else if cell_No == 3 {//金のかど
            if  boardMatrix[0][1] <= 0 { possibleMatrix [0][1] = 1}
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
        }
        else if cell_No == 22 {//金のかど
            if  boardMatrix[6][0] <= 0 { possibleMatrix [6][0] = 1}
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
        }
        else if cell_No == 24 {//金のかど
            if  boardMatrix[6][2] <= 0 { possibleMatrix [6][2] = 1}
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
    }
    func callGoldR(cell_No : Int){
        if  4 < cell_No && cell_No < 22 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[(cell_No-3)/3][0] >= 0 {possibleP2Matrix [(cell_No-3)/3][0] = 1}
            if  boardMatrix[(cell_No-3)/3][1] >= 0 {possibleP2Matrix [(cell_No-3)/3][1] = 1}
            if  boardMatrix[(cell_No-3)/3][2] >= 0 {possibleP2Matrix [(cell_No-3)/3][2] = 1}
            if  boardMatrix[(cell_No)/3][0] >= 0 {possibleP2Matrix [(cell_No)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][2] >= 0 {possibleP2Matrix [(cell_No)/3][2] = 1}
            if  boardMatrix[(cell_No+3)/3][1] >= 0 {possibleP2Matrix [(cell_No+3)/3][1] = 1}
        }
        else if  4 < cell_No && cell_No < 22 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No-4)/3][1] >= 0 {possibleP2Matrix [(cell_No-4)/3][1] = 1}
            if  boardMatrix[(cell_No-4)/3][2] >= 0 {possibleP2Matrix [(cell_No-4)/3][2] = 1}
            if  boardMatrix[(cell_No-1)/3][1] >= 0 {possibleP2Matrix [(cell_No-1)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][2] >= 0 {possibleP2Matrix [(cell_No+2)/3][2] = 1}
        }
        else if  3 < cell_No && cell_No < 22 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No-2)/3][0] >= 0 {possibleP2Matrix [(cell_No-2)/3][0] = 1}
            if  boardMatrix[(cell_No-2)/3][1] >= 0 {possibleP2Matrix [(cell_No-2)/3][1] = 1}
            if  boardMatrix[(cell_No)/3][1] >= 0 {possibleP2Matrix [(cell_No)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][0] >= 0 {possibleP2Matrix [(cell_No+2)/3][0] = 1}
        }
        else if cell_No == 2 {
            print("初期値")
            if  boardMatrix[0][0] >= 0 { possibleP2Matrix [0][0] = 1}
            if  boardMatrix[0][2] >= 0 { possibleP2Matrix [0][2] = 1}
            if  boardMatrix[1][1] >= 0 { possibleP2Matrix [1][1] = 1}
        }
        else if cell_No == 23 {
            if  boardMatrix[7][0] >= 0 { possibleP2Matrix [7][0] = 1}
            if  boardMatrix[7][2] >= 0 { possibleP2Matrix [7][2] = 1}
            if  boardMatrix[6][0] >= 0 { possibleP2Matrix [6][0] = 1}
            if  boardMatrix[6][1] >= 0 { possibleP2Matrix [6][1] = 1}
            if  boardMatrix[6][2] >= 0 { possibleP2Matrix [6][2] = 1}
        }
        else if cell_No == 1 {//王のかど
            if  boardMatrix[0][1] >= 0 { possibleP2Matrix [0][1] = 1}
            if  boardMatrix[1][0] >= 0 { possibleP2Matrix [1][0] = 1}
        }
        else if cell_No == 3 {//王のかど
            if  boardMatrix[0][1] >= 0 { possibleP2Matrix [0][1] = 1}
            if  boardMatrix[1][2] >= 0 { possibleP2Matrix [1][2] = 1}
        }
        else if cell_No == 22 {//王のかど
            if  boardMatrix[6][1] >= 0 { possibleP2Matrix [6][1] = 1}
            if  boardMatrix[6][0] >= 0 { possibleP2Matrix [6][0] = 1}
            if  boardMatrix[7][1] >= 0 { possibleP2Matrix [7][1] = 1}
        }
        else if cell_No == 24 {//王のかど
            if  boardMatrix[6][1] >= 0 { possibleP2Matrix [6][1] = 1}
            if  boardMatrix[6][2] >= 0 { possibleP2Matrix [6][2] = 1}
            if  boardMatrix[7][1] >= 0 { possibleP2Matrix [7][1] = 1}
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
    }
    func callSilva(cell_No : Int){
        if  4 < cell_No && cell_No < 22 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[(cell_No-3)/3][0] <= 0 {possibleMatrix [(cell_No-3)/3][0] = 1}
            if  boardMatrix[(cell_No+3)/3][1] <= 0 {possibleMatrix [(cell_No+3)/3][1] = 1}
            if  boardMatrix[(cell_No-3)/3][2] <= 0 {possibleMatrix [(cell_No-3)/3][2] = 1}
            if  boardMatrix[(cell_No+3)/3][0] <= 0 {possibleMatrix [(cell_No+3)/3][0] = 1}
            if  boardMatrix[(cell_No+3)/3][2] <= 0 {possibleMatrix [(cell_No+3)/3][2] = 1}
        }
        else if  4 < cell_No && cell_No < 22 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No-4)/3][1] <= 0 {possibleMatrix [(cell_No-4)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][2] <= 0 {possibleMatrix [(cell_No+2)/3][2] = 1}
            if  boardMatrix[(cell_No+2)/3][1] <= 0 {possibleMatrix [(cell_No+2)/3][1] = 1}
        }
        else if  3 < cell_No && cell_No < 22 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No+2)/3][0] <= 0 {possibleMatrix [(cell_No+2)/3][0] = 1}
            if  boardMatrix[(cell_No-2)/3][1] <= 0 {possibleMatrix [(cell_No-2)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][1] <= 0 {possibleMatrix [(cell_No+2)/3][1] = 1}
        }
        else if cell_No == 2 {
            print("初期値")
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
        }
        else if cell_No == 23 {
            if  boardMatrix[6][0] <= 0 { possibleMatrix [6][0] = 1}
            if  boardMatrix[6][2] <= 0 { possibleMatrix [6][2] = 1}
        }
        else if cell_No == 1 {//銀のかど
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
        }
        else if cell_No == 3 {//銀のかど
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
        }
        else if cell_No == 22 {//銀のかど
            if  boardMatrix[6][1] <= 0 { possibleMatrix [6][1] = 1}
        }
        else if cell_No == 24 {//銀のかど
            if  boardMatrix[6][1] <= 0 { possibleMatrix [6][1] = 1}
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
    }
    func callSilvaR(cell_No : Int){
        if  4 < cell_No && cell_No < 22 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[(cell_No-3)/3][0] >= 0 {possibleP2Matrix [(cell_No-3)/3][0] = 1}
            if  boardMatrix[(cell_No-3)/3][1] >= 0 {possibleP2Matrix [(cell_No-3)/3][1] = 1}
            if  boardMatrix[(cell_No-3)/3][2] >= 0 {possibleP2Matrix [(cell_No-3)/3][2] = 1}
            if  boardMatrix[(cell_No+3)/3][0] >= 0 {possibleP2Matrix [(cell_No+3)/3][0] = 1}
            if  boardMatrix[(cell_No+3)/3][2] >= 0 {possibleP2Matrix [(cell_No+3)/3][2] = 1}
        }
        else if  4 < cell_No && cell_No < 22 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No-4)/3][1] >= 0 {possibleP2Matrix [(cell_No-4)/3][1] = 1}
            if  boardMatrix[(cell_No-4)/3][2] >= 0 {possibleP2Matrix [(cell_No-4)/3][2] = 1}
            if  boardMatrix[(cell_No+2)/3][1] >= 0 {possibleP2Matrix [(cell_No+2)/3][1] = 1}
        }
        else if  3 < cell_No && cell_No < 22 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No-2)/3][0] >= 0 {possibleP2Matrix [(cell_No-2)/3][0] = 1}
            if  boardMatrix[(cell_No-2)/3][1] >= 0 {possibleP2Matrix [(cell_No-2)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][1] >= 0 {possibleP2Matrix [(cell_No+2)/3][1] = 1}
        }
        else if cell_No == 2 {
            print("初期値")
            if  boardMatrix[1][0] >= 0 { possibleP2Matrix [1][0] = 1}
            if  boardMatrix[1][2] >= 0  { possibleP2Matrix [1][2] = 1}
        }
        else if cell_No == 23 {
            if  boardMatrix[6][0] >= 0 { possibleP2Matrix [6][0] = 1}
            if  boardMatrix[6][1] >= 0 { possibleP2Matrix [6][1] = 1}
            if  boardMatrix[6][2] >= 0 { possibleP2Matrix [6][2] = 1}
        }
        else if cell_No == 1 {//王のかど
            if  boardMatrix[1][1] >= 0 { possibleP2Matrix [1][1] = 1}
        }
        else if cell_No == 3 {//王のかど
            if  boardMatrix[1][1] >= 0 { possibleP2Matrix [1][1] = 1}
        }
        else if cell_No == 22 {//王のかど
            if  boardMatrix[6][1] >= 0 { possibleP2Matrix [6][1] = 1}
            if  boardMatrix[6][0] >= 0 { possibleP2Matrix [6][0] = 1}
        }
        else if cell_No == 24 {//王のかど
            if  boardMatrix[6][1] >= 0 { possibleP2Matrix [6][1] = 1}
            if  boardMatrix[6][2] >= 0 { possibleP2Matrix [6][2] = 1}
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
    }
    
    func callHose(cell_No : Int){
        if  0 < cell_No && cell_No < 18 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[(cell_No+5)/3][0] <= 0 {possibleMatrix [(cell_No+5)/3][0] = 1}
            if  boardMatrix[(cell_No+5)/3][2] <= 0 {possibleMatrix [(cell_No+5)/3][2] = 1}
        }
        else if  0 < cell_No && cell_No < 19 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No+5)/3][1] <= 0 {possibleMatrix [(cell_No+5)/3][1] = 1}
        }
        else if  0 <= cell_No && cell_No < 18 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No+5)/3][1] <= 0 {possibleMatrix [(cell_No+5)/3][1] = 1}
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
    }
    
    func callHoseR(cell_No : Int){
        if  7 < cell_No && cell_No < 24 && cell_No % 3 == 2  {
            print("中央")
            if  boardMatrix[(cell_No-6)/3][0] >= 0 {possibleP2Matrix [(cell_No-6)/3][0] = 1}
            if  boardMatrix[(cell_No-6)/3][2] >= 0 {possibleP2Matrix [(cell_No-6)/3][2] = 1}
        }
        else if  6 < cell_No && cell_No < 25 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No-7)/3][1] >= 0 {possibleP2Matrix [(cell_No-7)/3][1] = 1}
        }
        else if  7 <= cell_No && cell_No < 25 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No-6)/3][1] >= 0 {possibleP2Matrix [(cell_No-6)/3][1] = 1}
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
    }
    func callKyo(cell_No : Int){
        if  0 < cell_No && cell_No < 24 && cell_No % 3 == 2 {
            print("中央")
            for x in (cell_No+3)/3 ... 7{
                if boardMatrix[x][1] > 0{
                    break
                }
                else if boardMatrix[x][1] < 0{
                    possibleMatrix [x][1] = 1
                    break
                }
                else {possibleMatrix [x][1] = 1}
            }
        }
        else if  0 < cell_No && cell_No < 25 && cell_No % 3 == 0 {
            print("右サイド")
            for x in (cell_No+2)/3 ... 7{
                if boardMatrix[x][2] > 0{
                    break
                }
                else if boardMatrix[x][2] < 0{
                    possibleMatrix [x][2] = 1
                    break
                }
                else {possibleMatrix [x][2] = 1}
            }
        }
        else if  0 <= cell_No && cell_No < 24 && cell_No % 3 == 1 {
            print("左サイド")
            for x in (cell_No+3)/3 ... 7{
                if boardMatrix[x][0] > 0{
                    break
                }
                else if boardMatrix[x][0] < 0{
                    possibleMatrix [x][0] = 1
                    break
                }
                else {possibleMatrix [x][0] = 1}
            }
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
    }
    func callKyoR(cell_No : Int){
        if  0 < cell_No && cell_No < 24 && cell_No % 3 == 2 {
            print("中央")
            for x in (0 ... (cell_No-3)/3).reversed(){
                print("aaaa"+String(x))
                if boardMatrix[x][1] < 0{
                    break
                }
                else if boardMatrix[x][1] > 0{
                    possibleP2Matrix [x][1] = 1
                    break
                }
                else {
                    possibleP2Matrix [x][1] = 1
                }
            }
        }
        else if  0 < cell_No && cell_No < 25 && cell_No % 3 == 0 {
            print("右サイド")
            for x in (0 ... (cell_No-4)/3).reversed() {
                if boardMatrix[x][2] < 0{
                    break
                }
                else if boardMatrix[x][2] > 0{
                    possibleP2Matrix [x][2] = 1
                    break
                }
                else {possibleP2Matrix [x][2] = 1}
            }
        }
        else if  0 <= cell_No && cell_No < 24 && cell_No % 3 == 1 {
            print("左サイド")
            for x in (0 ... (cell_No-3)/3).reversed(){
                if boardMatrix[x][0] < 0{
                    break
                }
                else if boardMatrix[x][0] > 0{
                    possibleP2Matrix [x][0] = 1
                    break
                }
                else {possibleP2Matrix [x][0] = 1}
            }
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
    }
    func callWing(cell_No : Int){
        if  0 < cell_No && cell_No < 24 && cell_No % 3 == 2 {
            print("中央")
            for x in (cell_No+2)/3 ... 8{
                if x < 8{
                    if boardMatrix[x][1] > 0{
                        break
                    }
                    else if boardMatrix[x][1] < 0{
                        possibleMatrix [x][1] = 1
                        break
                    }
                    else {possibleMatrix [x][1] = 1}
                }
                
            }
            for x in (0 ... (cell_No-3)/3).reversed(){
                print("aaaa"+String(x))
                if boardMatrix[x][1] > 0{
                    break
                }
                else if boardMatrix[x][1] < 0{
                    possibleMatrix [x][1] = 1
                    break
                }
                else {
                    possibleMatrix [x][1] = 1
                }
            }
            if  boardMatrix[(cell_No)/3][0] <= 0 {possibleMatrix [(cell_No)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][2] <= 0 {possibleMatrix [(cell_No)/3][2] = 1}
        }
        else if  0 < cell_No && cell_No < 25 && cell_No % 3 == 0 {
            print("右サイド")
            for x in (cell_No + 2)/3 ... 8{
                if x < 8{
                    if boardMatrix[x][2] > 0{
                        break
                    }
                    else if boardMatrix[x][2] < 0{
                        possibleMatrix [x][2] = 1
                        break
                    }
                    else {possibleMatrix [x][2] = 1}
                }
                
            }
            for x in (0 ... (cell_No-4)/3).reversed() {
                if boardMatrix[x][2] > 0{
                    break
                }
                else if boardMatrix[x][2] < 0{
                    possibleMatrix [x][2] = 1
                    break
                }
                else {possibleMatrix [x][2] = 1}
            }
            if  boardMatrix[(cell_No-3)/3][1] <= 0 {
                possibleMatrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-3)/3][0] <= 0 && boardMatrix[(cell_No-3)/3][1] >= 0{
                    possibleMatrix [(cell_No-3)/3][0] = 1
                }
            }
        }
        else if  0 <= cell_No && cell_No < 24 && cell_No % 3 == 1 {
            print("左サイド")
            for x in (cell_No+2)/3 ... 8{
                if x < 8{
                    if boardMatrix[x][0] > 0{
                        break
                    }
                    else if boardMatrix[x][0] < 0{
                        possibleMatrix [x][0] = 1
                        break
                    }
                    else {possibleMatrix [x][0] = 1}
                }
                
            }
            for x in (0 ... (cell_No-3)/3).reversed(){
                if boardMatrix[x][0] > 0{
                    break
                }
                else if boardMatrix[x][0] < 0{
                    possibleMatrix [x][0] = 1
                    break
                }
                else {possibleMatrix [x][0] = 1}
            }
            if  boardMatrix[(cell_No)/3][1] <= 0 {
                possibleMatrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No)/3][2] <= 0 && boardMatrix[(cell_No)/3][1] >= 0{
                    possibleMatrix [(cell_No)/3][2] = 1
                }
            }
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
    }
    func callWingR(cell_No : Int){
        if  0 < cell_No && cell_No < 24 && cell_No % 3 == 2 {
            print("中央")
            for x in (cell_No+2)/3 ... 8{
                if x < 8{
                    if boardMatrix[x][1] < 0{
                        break
                    }
                    else if boardMatrix[x][1] > 0{
                        possibleP2Matrix [x][1] = 1
                        break
                    }
                    else {possibleP2Matrix [x][1] = 1}
                }
                
            }
            for x in (0 ... (cell_No-3)/3).reversed(){
                print("aaaa"+String(x))
                if boardMatrix[x][1] < 0{
                    break
                }
                else if boardMatrix[x][1] > 0{
                    possibleP2Matrix [x][1] = 1
                    break
                }
                else {
                    possibleP2Matrix [x][1] = 1
                }
            }
            if  boardMatrix[(cell_No)/3][0] >= 0 {possibleP2Matrix [(cell_No)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][2] >= 0 {possibleP2Matrix [(cell_No)/3][2] = 1}
        }
        else if  0 < cell_No && cell_No < 25 && cell_No % 3 == 0 {
            print("右サイド")
            for x in (cell_No+2)/3 ... 8{
                if x < 8{
                    if boardMatrix[x][2] < 0{
                        break
                    }
                    else if boardMatrix[x][2] > 0{
                        possibleP2Matrix [x][2] = 1
                        break
                    }
                    else {possibleP2Matrix [x][2] = 1}

                }
            }
            for x in (0 ... (cell_No-4)/3).reversed() {
                if boardMatrix[x][2] < 0{
                    break
                }
                else if boardMatrix[x][2] > 0{
                    possibleP2Matrix [x][2] = 1
                    break
                }
                else {possibleP2Matrix [x][2] = 1}
            }
            if  boardMatrix[(cell_No-3)/3][1] >= 0 {
                possibleP2Matrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-3)/3][0] >= 0 && boardMatrix[(cell_No-3)/3][1] <= 0{
                    possibleP2Matrix [(cell_No-3)/3][0] = 1
                }
            }
        }
        else if  0 <= cell_No && cell_No < 24 && cell_No % 3 == 1 {
            print("左サイド")
            for x in (cell_No+2)/3 ... 8{
                if x < 8{
                    if boardMatrix[x][0] < 0{
                        break
                    }
                    else if boardMatrix[x][0] > 0{
                        possibleP2Matrix [x][0] = 1
                        break
                    }
                    else {possibleP2Matrix [x][0] = 1}
                }
               
            }
            for x in (0 ... (cell_No-3)/3).reversed(){
                if boardMatrix[x][0] < 0{
                    break
                }
                else if boardMatrix[x][0] > 0{
                    possibleP2Matrix [x][0] = 1
                    break
                }
                else {possibleP2Matrix [x][0] = 1}
            }
            if  boardMatrix[(cell_No)/3][1] >= 0 {
                possibleP2Matrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No)/3][2] >= 0 && boardMatrix[(cell_No)/3][1] <= 0{
                    possibleP2Matrix [(cell_No)/3][2] = 1
                }
            }
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
    }
    
    func calldragonKing(cell_No : Int){
        if  0 < cell_No && cell_No < 24 && cell_No % 3 == 2 {
            print("中央")
            for x in (cell_No+2)/3 ... 8{
                if x < 8{
                    if boardMatrix[x][1] > 0{
                        break
                    }
                    else if boardMatrix[x][1] < 0{
                        possibleMatrix [x][1] = 1
                        break
                    }
                    else {possibleMatrix [x][1] = 1}
                }
                
            }
            for x in (0 ... (cell_No-3)/3).reversed(){
                print("aaaa"+String(x))
                if boardMatrix[x][1] > 0{
                    break
                }
                else if boardMatrix[x][1] < 0{
                    possibleMatrix [x][1] = 1
                    break
                }
                else {
                    possibleMatrix [x][1] = 1
                }
            }
            if  boardMatrix[(cell_No)/3][0] <= 0 {possibleMatrix [(cell_No)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][2] <= 0 {possibleMatrix [(cell_No)/3][2] = 1}
        }
        else if  0 < cell_No && cell_No < 25 && cell_No % 3 == 0 {
            print("右サイド")
            for x in (cell_No + 2)/3 ... 8{
                if x < 8{
                    if boardMatrix[x][2] > 0{
                        break
                    }
                    else if boardMatrix[x][2] < 0{
                        possibleMatrix [x][2] = 1
                        break
                    }
                    else {possibleMatrix [x][2] = 1}
                }
                
            }
            for x in (0 ... (cell_No-4)/3).reversed() {
                if boardMatrix[x][2] > 0{
                    break
                }
                else if boardMatrix[x][2] < 0{
                    possibleMatrix [x][2] = 1
                    break
                }
                else {possibleMatrix [x][2] = 1}
            }
            if  boardMatrix[(cell_No-3)/3][1] <= 0 {
                possibleMatrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-3)/3][0] <= 0 && boardMatrix[(cell_No-3)/3][1] >= 0{
                    possibleMatrix [(cell_No-3)/3][0] = 1
                }
            }
        }
        else if  0 <= cell_No && cell_No < 24 && cell_No % 3 == 1 {
            print("左サイド")
            for x in (cell_No+2)/3 ... 8{
                if x < 8{
                    if boardMatrix[x][0] > 0{
                        break
                    }
                    else if boardMatrix[x][0] < 0{
                        possibleMatrix [x][0] = 1
                        break
                    }
                    else {possibleMatrix [x][0] = 1}
                }
                
            }
            for x in (0 ... (cell_No-3)/3).reversed(){
                if boardMatrix[x][0] > 0{
                    break
                }
                else if boardMatrix[x][0] < 0{
                    possibleMatrix [x][0] = 1
                    break
                }
                else {possibleMatrix [x][0] = 1}
            }
            if  boardMatrix[(cell_No)/3][1] <= 0 {
                possibleMatrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No)/3][2] <= 0 && boardMatrix[(cell_No)/3][1] >= 0{
                    possibleMatrix [(cell_No)/3][2] = 1
                }
            }
        }
        if  4 < cell_No && cell_No < 22 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[(cell_No-3)/3][0] <= 0 {possibleMatrix [(cell_No-3)/3][0] = 1}
            if  boardMatrix[(cell_No-3)/3][2] <= 0 {possibleMatrix [(cell_No-3)/3][2] = 1}
            if  boardMatrix[(cell_No+3)/3][0] <= 0 {possibleMatrix [(cell_No+3)/3][0] = 1}
            if  boardMatrix[(cell_No+3)/3][2] <= 0 {possibleMatrix [(cell_No+3)/3][2] = 1}
        }
        else if  4 < cell_No && cell_No < 22 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No-4)/3][1] <= 0 {possibleMatrix [(cell_No-4)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][1] <= 0 {possibleMatrix [(cell_No+2)/3][1] = 1}
        }
        else if  3 < cell_No && cell_No < 22 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No-2)/3][1] <= 0 {possibleMatrix [(cell_No-2)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][1] <= 0 {possibleMatrix [(cell_No+2)/3][1] = 1}
        }
        else if cell_No == 2 {
            print("初期値")
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
        }
        else if cell_No == 23 {
            if  boardMatrix[6][0] <= 0 { possibleMatrix [6][0] = 1}
            if  boardMatrix[6][2] <= 0 { possibleMatrix [6][2] = 1}
        }
        else if cell_No == 1 {//王のかど
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
        }
        else if cell_No == 3 {//王のかど
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
        }
        else if cell_No == 22 {//王のかど
            if  boardMatrix[6][1] <= 0 { possibleMatrix [6][1] = 1}
        }
        else if cell_No == 24 {//王のかど
            if  boardMatrix[6][1] <= 0 { possibleMatrix [6][1] = 1}
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
    }
    func calldragonKingR(cell_No : Int){
        if  0 < cell_No && cell_No < 24 && cell_No % 3 == 2 {
            print("中央")
            for x in (cell_No+2)/3 ... 8{
                if x < 8{
                    if boardMatrix[x][1] < 0{
                        break
                    }
                    else if boardMatrix[x][1] > 0{
                        possibleP2Matrix [x][1] = 1
                        break
                    }
                    else {possibleP2Matrix [x][1] = 1}
                }
                
            }
            for x in (0 ... (cell_No-3)/3).reversed(){
                print("aaaa"+String(x))
                if boardMatrix[x][1] < 0{
                    break
                }
                else if boardMatrix[x][1] > 0{
                    possibleP2Matrix [x][1] = 1
                    break
                }
                else {
                    possibleP2Matrix [x][1] = 1
                }
            }
            if  boardMatrix[(cell_No)/3][0] >= 0 {possibleP2Matrix [(cell_No)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][2] >= 0 {possibleP2Matrix [(cell_No)/3][2] = 1}
        }
        else if  0 < cell_No && cell_No < 25 && cell_No % 3 == 0 {
            print("右サイド")
            for x in (cell_No+2)/3 ... 8{
                if x < 8{
                    if boardMatrix[x][2] < 0{
                        break
                    }
                    else if boardMatrix[x][2] > 0{
                        possibleP2Matrix [x][2] = 1
                        break
                    }
                    else {possibleP2Matrix [x][2] = 1}
                    
                }
            }
            for x in (0 ... (cell_No-4)/3).reversed() {
                if boardMatrix[x][2] < 0{
                    break
                }
                else if boardMatrix[x][2] > 0{
                    possibleP2Matrix [x][2] = 1
                    break
                }
                else {possibleP2Matrix [x][2] = 1}
            }
            if  boardMatrix[(cell_No-3)/3][1] >= 0 {
                possibleP2Matrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-3)/3][0] >= 0 && boardMatrix[(cell_No-3)/3][1] <= 0{
                    possibleP2Matrix [(cell_No-3)/3][0] = 1
                }
            }
        }
        else if  0 <= cell_No && cell_No < 24 && cell_No % 3 == 1 {
            print("左サイド")
            for x in (cell_No+2)/3 ... 8{
                if x < 8{
                    if boardMatrix[x][0] < 0{
                        break
                    }
                    else if boardMatrix[x][0] > 0{
                        possibleP2Matrix [x][0] = 1
                        break
                    }
                    else {possibleP2Matrix [x][0] = 1}
                }
                
            }
            for x in (0 ... (cell_No-3)/3).reversed(){
                if boardMatrix[x][0] < 0{
                    break
                }
                else if boardMatrix[x][0] > 0{
                    possibleP2Matrix [x][0] = 1
                    break
                }
                else {possibleP2Matrix [x][0] = 1}
            }
            if  boardMatrix[(cell_No)/3][1] >= 0 {
                possibleP2Matrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No)/3][2] >= 0 && boardMatrix[(cell_No)/3][1] <= 0{
                    possibleP2Matrix [(cell_No)/3][2] = 1
                }
            }
        }
        if  4 < cell_No && cell_No < 22 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[(cell_No-3)/3][0] >= 0 {possibleP2Matrix [(cell_No-3)/3][0] = 1}
            if  boardMatrix[(cell_No-3)/3][2] >= 0 {possibleP2Matrix [(cell_No-3)/3][2] = 1}
            if  boardMatrix[(cell_No+3)/3][0] >= 0 {possibleP2Matrix [(cell_No+3)/3][0] = 1}
            if  boardMatrix[(cell_No+3)/3][2] >= 0 {possibleP2Matrix [(cell_No+3)/3][2] = 1}
        }
        else if  4 < cell_No && cell_No < 22 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No-4)/3][1] >= 0 {possibleP2Matrix [(cell_No-4)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][1] >= 0 {possibleP2Matrix [(cell_No+2)/3][1] = 1}
        }
        else if  3 < cell_No && cell_No < 22 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No-2)/3][1] >= 0 {possibleP2Matrix [(cell_No-2)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][1] >= 0 {possibleP2Matrix [(cell_No+2)/3][1] = 1}
        }
        else if cell_No == 2 {
            print("初期値")
            if  boardMatrix[1][0] >= 0 { possibleP2Matrix [1][0] = 1}
            if  boardMatrix[1][2] >= 0 { possibleP2Matrix [1][2] = 1}
        }
        else if cell_No == 23 {
            if  boardMatrix[6][0] >= 0 { possibleP2Matrix [6][0] = 1}
            if  boardMatrix[6][2] >= 0 { possibleP2Matrix [6][2] = 1}
        }
        else if cell_No == 1 {//王のかど
            if  boardMatrix[1][1] >= 0 { possibleP2Matrix [1][1] = 1}
        }
        else if cell_No == 3 {//王のかど
            if  boardMatrix[1][1] >= 0 { possibleP2Matrix [1][1] = 1}
        }
        else if cell_No == 22 {//王のかど
            if  boardMatrix[6][1] >= 0 { possibleP2Matrix [6][1] = 1}
        }
        else if cell_No == 24 {//王のかど
            if  boardMatrix[6][1] >= 0 { possibleP2Matrix [6][1] = 1}
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
    }
    func callKaku(cell_No : Int){
        if  4 < cell_No && cell_No < 21 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[(cell_No-3)/3][0] <= 0 {possibleMatrix [(cell_No-3)/3][0] = 1}
            if  boardMatrix[(cell_No-3)/3][2] <= 0 {possibleMatrix [(cell_No-3)/3][2] = 1}
            if  boardMatrix[(cell_No+3)/3][0] <= 0 {possibleMatrix [(cell_No+3)/3][0] = 1}
            if  boardMatrix[(cell_No+3)/3][2] <= 0 {possibleMatrix [(cell_No+3)/3][2] = 1}
        }
        else if  7 < cell_No && cell_No < 19 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No)/3][1] <= 0 {
                possibleMatrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No+3)/3][0] <= 0 && boardMatrix[(cell_No)/3][1] >= 0{
                    possibleMatrix [(cell_No+3)/3][0] = 1
                }
            }
            if  boardMatrix[(cell_No-6)/3][1] <= 0 {
                possibleMatrix [(cell_No-6)/3][1] = 1
                if  boardMatrix[(cell_No-8)/3][0] <= 0 && boardMatrix[(cell_No-6)/3][1] >= 0{
                    possibleMatrix [(cell_No-8)/3][0] = 1
                }
            }
        }
        else if  6 < cell_No && cell_No < 19 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No-3)/3][1] <= 0 {
                possibleMatrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-6)/3][2] <= 0 && boardMatrix[(cell_No-3)/3][1] >= 0{
                    possibleMatrix [(cell_No-6)/3][2] = 1
                }
            }
            if  boardMatrix[(cell_No+3)/3][1] <= 0 {
                possibleMatrix [(cell_No+3)/3][1] = 1
                if  boardMatrix[(cell_No+6)/3][2] <= 0 && boardMatrix[(cell_No+3)/3][1] >= 0{
                    possibleMatrix [(cell_No+6)/3][2] = 1
                }
            }
        }
        else if cell_No == 2 {
            print("初期値")
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}
        }
        else if cell_No == 23 {
            if  boardMatrix[6][2] <= 0 { possibleMatrix [6][2] = 1}
            if  boardMatrix[6][0] <= 0 { possibleMatrix [6][0] = 1}
        }
        else if cell_No == 4 {
            if  boardMatrix[(cell_No+3)/3][1] <= 0 {
                possibleMatrix [(cell_No+3)/3][1] = 1
                if  boardMatrix[(cell_No+6)/3][2] <= 0 && boardMatrix[(cell_No+3)/3][1] >= 0{
                    possibleMatrix [(cell_No+6)/3][2] = 1
                }
            }
            if  boardMatrix[0][1] <= 0 { possibleMatrix [0][1] = 1}
        }
        else if cell_No == 6 {
            if  boardMatrix[(cell_No)/3][1] <= 0 {
                possibleMatrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No+3)/3][0] <= 0 && boardMatrix[(cell_No)/3][1] >= 0{
                    possibleMatrix [(cell_No+3)/3][0] = 1
                }
            }
            if  boardMatrix[0][1] <= 0 { possibleMatrix [0][1] = 1}
        }
        else if cell_No == 21 {
            if  boardMatrix[(cell_No-6)/3][1] <= 0 {
                possibleMatrix [(cell_No-6)/3][1] = 1
                if  boardMatrix[(cell_No-8)/3][0] <= 0 && boardMatrix[(cell_No-6)/3][1] >= 0{
                    possibleMatrix [(cell_No-8)/3][0] = 1
                }
            }
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
        }
        else if cell_No == 19 {
            if  boardMatrix[(cell_No-3)/3][1] <= 0 {
                possibleMatrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-6)/3][2] <= 0 && boardMatrix[(cell_No-3)/3][1] >= 0{
                    possibleMatrix [(cell_No-6)/3][2] = 1
                }
            }
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
        }
        else if cell_No == 1 {//王のかど
            if  boardMatrix[(cell_No+3)/3][1] <= 0 {
                possibleMatrix [(cell_No+3)/3][1] = 1
                if  boardMatrix[(cell_No+6)/3][2] <= 0 && boardMatrix[(cell_No+3)/3][1] >= 0{
                    possibleMatrix [(cell_No+6)/3][2] = 1
                }
            }
        }
        else if cell_No == 3 {//王のかど
            if  boardMatrix[(cell_No)/3][1] <= 0 {
                possibleMatrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No+3)/3][0] <= 0 && boardMatrix[(cell_No)/3][1] >= 0{
                    possibleMatrix [(cell_No+3)/3][0] = 1
                }
            }
        }
        else if cell_No == 22 {//王のかど
            if  boardMatrix[(cell_No-3)/3][1] <= 0 {
                possibleMatrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-6)/3][2] <= 0 && boardMatrix[(cell_No-3)/3][1] >= 0{
                    possibleMatrix [(cell_No-6)/3][2] = 1
                }
            }
        }
        else if cell_No == 24 {//王のかど
            if  boardMatrix[(cell_No-6)/3][1] <= 0 {
                possibleMatrix [(cell_No-6)/3][1] = 1
                if  boardMatrix[(cell_No-8)/3][0] <= 0 && boardMatrix[(cell_No-6)/3][1] >= 0{
                    possibleMatrix [(cell_No-8)/3][0] = 1
                }
            }
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
        
    }
    func callDragonHose(cell_No : Int){
        if  4 < cell_No && cell_No < 21 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[(cell_No-3)/3][0] <= 0 {possibleMatrix [(cell_No-3)/3][0] = 1}
            if  boardMatrix[(cell_No-3)/3][2] <= 0 {possibleMatrix [(cell_No-3)/3][2] = 1}
            if  boardMatrix[(cell_No+3)/3][0] <= 0 {possibleMatrix [(cell_No+3)/3][0] = 1}
            if  boardMatrix[(cell_No+3)/3][2] <= 0 {possibleMatrix [(cell_No+3)/3][2] = 1}
            if  boardMatrix[(cell_No-3)/3][1] <= 0 {possibleMatrix [(cell_No-3)/3][1] = 1}
            if  boardMatrix[(cell_No)/3][0] <= 0 {possibleMatrix [(cell_No)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][2] <= 0 {possibleMatrix [(cell_No)/3][2] = 1}
            if  boardMatrix[(cell_No+3)/3][1] <= 0 {possibleMatrix [(cell_No+3)/3][1] = 1}

        }
        else if  7 < cell_No && cell_No < 19 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No)/3][1] <= 0 {
                possibleMatrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No+3)/3][0] <= 0 && boardMatrix[(cell_No)/3][1] >= 0{
                    possibleMatrix [(cell_No+3)/3][0] = 1
                }
            }
            if  boardMatrix[(cell_No-6)/3][1] <= 0 {
                possibleMatrix [(cell_No-6)/3][1] = 1
                if  boardMatrix[(cell_No-8)/3][0] <= 0 && boardMatrix[(cell_No-6)/3][1] >= 0{
                    possibleMatrix [(cell_No-8)/3][0] = 1
                }
            }
            if  boardMatrix[(cell_No-4)/3][2] <= 0 {possibleMatrix [(cell_No-4)/3][2] = 1}
            if  boardMatrix[(cell_No-1)/3][1] <= 0 {possibleMatrix [(cell_No-1)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][2] <= 0 {possibleMatrix [(cell_No+2)/3][2] = 1}
        }
        else if  6 < cell_No && cell_No < 19 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No-3)/3][1] <= 0 {
                possibleMatrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-6)/3][2] <= 0 && boardMatrix[(cell_No-3)/3][1] >= 0{
                    possibleMatrix [(cell_No-6)/3][2] = 1
                }
            }
            if  boardMatrix[(cell_No+3)/3][1] <= 0 {
                possibleMatrix [(cell_No+3)/3][1] = 1
                if  boardMatrix[(cell_No+6)/3][2] <= 0 && boardMatrix[(cell_No+3)/3][1] >= 0{
                    possibleMatrix [(cell_No+6)/3][2] = 1
                }
            }
            if  boardMatrix[(cell_No-2)/3][0] <= 0 {possibleMatrix [(cell_No-2)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][1] <= 0 {possibleMatrix [(cell_No)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][0] <= 0 {possibleMatrix [(cell_No+2)/3][0] = 1}
        }
        else if cell_No == 2 {
            print("初期値")
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}
            if  boardMatrix[0][0] <= 0 { possibleMatrix [0][0] = 1}
            if  boardMatrix[0][2] <= 0 { possibleMatrix [0][2] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
        }
        else if cell_No == 23 {
            if  boardMatrix[6][2] <= 0 { possibleMatrix [6][2] = 1}
            if  boardMatrix[6][0] <= 0 { possibleMatrix [6][0] = 1}
            if  boardMatrix[7][0] <= 0 { possibleMatrix [7][0] = 1}
            if  boardMatrix[7][2] <= 0 { possibleMatrix [7][2] = 1}
            if  boardMatrix[6][1] <= 0 { possibleMatrix [6][1] = 1}
        }
        else if cell_No == 4 {
            if  boardMatrix[(cell_No+3)/3][1] <= 0 {
                possibleMatrix [(cell_No+3)/3][1] = 1
                if  boardMatrix[(cell_No+6)/3][2] <= 0 && boardMatrix[(cell_No+3)/3][1] >= 0{
                    possibleMatrix [(cell_No+6)/3][2] = 1
                }
            }
            if  boardMatrix[0][1] <= 0 { possibleMatrix [0][1] = 1}
        }
        else if cell_No == 6 {
            if  boardMatrix[(cell_No)/3][1] <= 0 {
                possibleMatrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No+3)/3][0] <= 0 && boardMatrix[(cell_No)/3][1] >= 0{
                    possibleMatrix [(cell_No+3)/3][0] = 1
                }
            }
            if  boardMatrix[0][1] <= 0 { possibleMatrix [0][1] = 1}
        }
        else if cell_No == 21 {
            if  boardMatrix[(cell_No-6)/3][1] <= 0 {
                possibleMatrix [(cell_No-6)/3][1] = 1
                if  boardMatrix[(cell_No-8)/3][0] <= 0 && boardMatrix[(cell_No-6)/3][1] >= 0{
                    possibleMatrix [(cell_No-8)/3][0] = 1
                }
            }
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
            if  boardMatrix[(cell_No-4)/3][2] <= 0 {possibleMatrix [(cell_No-4)/3][2] = 1}
            if  boardMatrix[(cell_No-1)/3][1] <= 0 {possibleMatrix [(cell_No-1)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][2] <= 0 {possibleMatrix [(cell_No+2)/3][2] = 1}
        }
        else if cell_No == 19 {
            if  boardMatrix[(cell_No-3)/3][1] <= 0 {
                possibleMatrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-6)/3][2] <= 0 && boardMatrix[(cell_No-3)/3][1] >= 0{
                    possibleMatrix [(cell_No-6)/3][2] = 1
                }
            }
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
            if  boardMatrix[(cell_No-2)/3][0] <= 0 {possibleMatrix [(cell_No-2)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][1] <= 0 {possibleMatrix [(cell_No)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][0] <= 0 {possibleMatrix [(cell_No+2)/3][0] = 1}
        }
        else if cell_No == 1 {//王のかど
            if  boardMatrix[(cell_No+3)/3][1] <= 0 {
                possibleMatrix [(cell_No+3)/3][1] = 1
                if  boardMatrix[(cell_No+6)/3][2] <= 0 && boardMatrix[(cell_No+3)/3][1] >= 0{
                    possibleMatrix [(cell_No+6)/3][2] = 1
                }
            }
            if  boardMatrix[0][1] <= 0 { possibleMatrix [0][1] = 1}
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}

        }
        else if cell_No == 3 {//王のかど
            if  boardMatrix[(cell_No)/3][1] <= 0 {
                possibleMatrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No+3)/3][0] <= 0 && boardMatrix[(cell_No)/3][1] >= 0{
                    possibleMatrix [(cell_No+3)/3][0] = 1
                }
            }
            if  boardMatrix[0][1] <= 0 { possibleMatrix [0][1] = 1}
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
        }
        else if cell_No == 22 {//王のかど
            if  boardMatrix[(cell_No-3)/3][1] <= 0 {
                possibleMatrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-6)/3][2] <= 0 && boardMatrix[(cell_No-3)/3][1] >= 0{
                    possibleMatrix [(cell_No-6)/3][2] = 1
                }
            }
            if  boardMatrix[6][0] <= 0 { possibleMatrix [6][0] = 1}
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
        }
        else if cell_No == 24 {//王のかど
            if  boardMatrix[(cell_No-6)/3][1] <= 0 {
                possibleMatrix [(cell_No-6)/3][1] = 1
                if  boardMatrix[(cell_No-8)/3][0] <= 0 && boardMatrix[(cell_No-6)/3][1] >= 0{
                    possibleMatrix [(cell_No-8)/3][0] = 1
                }
            }
            if  boardMatrix[6][2] <= 0 { possibleMatrix [6][2] = 1}
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
        
    }
    func callKakuR(cell_No : Int){
        if  4 < cell_No && cell_No < 21 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[(cell_No-3)/3][0] >= 0 {possibleP2Matrix [(cell_No-3)/3][0] = 1}
            if  boardMatrix[(cell_No-3)/3][2] >= 0 {possibleP2Matrix [(cell_No-3)/3][2] = 1}
            if  boardMatrix[(cell_No+3)/3][0] >= 0 {possibleP2Matrix [(cell_No+3)/3][0] = 1}
            if  boardMatrix[(cell_No+3)/3][2] >= 0 {possibleP2Matrix [(cell_No+3)/3][2] = 1}
        }
        else if  7 < cell_No && cell_No < 19 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No)/3][1] >= 0 {
                possibleP2Matrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No+3)/3][0] >= 0 && boardMatrix[(cell_No)/3][1] <= 0{
                    possibleP2Matrix [(cell_No+3)/3][0] = 1
                }
            }
            if  boardMatrix[(cell_No-6)/3][1] >= 0 {
                possibleP2Matrix [(cell_No-6)/3][1] = 1
                if  boardMatrix[(cell_No-8)/3][0] >= 0 && boardMatrix[(cell_No-6)/3][1] <= 0{
                    possibleP2Matrix [(cell_No-8)/3][0] = 1
                }
            }
        }
        else if  6 < cell_No && cell_No < 19 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No-3)/3][1] >= 0 {
                possibleP2Matrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-6)/3][2] >= 0 && boardMatrix[(cell_No-3)/3][1] <= 0{
                    possibleP2Matrix [(cell_No-6)/3][2] = 1
                }
            }
            if  boardMatrix[(cell_No+3)/3][1] >= 0 {
                possibleP2Matrix [(cell_No+3)/3][1] = 1
                if  boardMatrix[(cell_No+6)/3][2] >= 0 && boardMatrix[(cell_No+3)/3][1] <= 0{
                    possibleP2Matrix [(cell_No+6)/3][2] = 1
                }
            }
        }
        else if cell_No == 2 {
            print("初期値")
            if  boardMatrix[1][2] >= 0 { possibleP2Matrix [1][2] = 1}
            if  boardMatrix[1][0] >= 0 { possibleP2Matrix [1][0] = 1}
        }
        else if cell_No == 23 {
            if  boardMatrix[6][2] >= 0 { possibleP2Matrix [6][2] = 1}
            if  boardMatrix[6][0] >= 0 { possibleP2Matrix [6][0] = 1}
        }
        else if cell_No == 4 {
            if  boardMatrix[(cell_No+3)/3][1] >= 0 {
                possibleP2Matrix [(cell_No+3)/3][1] = 1
                if  boardMatrix[(cell_No+6)/3][2] >= 0 && boardMatrix[(cell_No+3)/3][1] <= 0{
                    possibleP2Matrix [(cell_No+6)/3][2] = 1
                }
            }
            if  boardMatrix[0][1] >= 0 { possibleP2Matrix [0][1] = 1}
        }
        else if cell_No == 6 {
            if  boardMatrix[(cell_No)/3][1] >= 0 {
                possibleP2Matrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No+3)/3][0] >= 0 && boardMatrix[(cell_No)/3][1] <= 0{
                    possibleP2Matrix [(cell_No+3)/3][0] = 1
                }
            }
            if  boardMatrix[0][1] >= 0 { possibleP2Matrix [0][1] = 1}
        }
        else if cell_No == 21 {
            if  boardMatrix[(cell_No-6)/3][1] >= 0 {
                possibleP2Matrix [(cell_No-6)/3][1] = 1
                if  boardMatrix[(cell_No-8)/3][0] >= 0 && boardMatrix[(cell_No-6)/3][1] <= 0{
                    possibleP2Matrix [(cell_No-8)/3][0] = 1
                }
            }
            if  boardMatrix[7][1] >= 0 { possibleP2Matrix [7][1] = 1}
        }
        else if cell_No == 19 {
            if  boardMatrix[(cell_No-3)/3][1] >= 0 {
                possibleP2Matrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-6)/3][2] >= 0 && boardMatrix[(cell_No-3)/3][1] <= 0{
                    possibleP2Matrix [(cell_No-6)/3][2] = 1
                }
            }
            if  boardMatrix[7][1] >= 0 { possibleP2Matrix [7][1] = 1}
        }
        else if cell_No == 1 {//王のかど
            if  boardMatrix[(cell_No+3)/3][1] >= 0 {
                possibleP2Matrix [(cell_No+3)/3][1] = 1
                if  boardMatrix[(cell_No+6)/3][2] >= 0 && boardMatrix[(cell_No+3)/3][1] <= 0{
                    possibleP2Matrix [(cell_No+6)/3][2] = 1
                }
            }
        }
        else if cell_No == 3 {//王のかど
            if  boardMatrix[(cell_No)/3][1] >= 0 {
                possibleP2Matrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No+3)/3][0] >= 0 && boardMatrix[(cell_No)/3][1] <= 0{
                    possibleP2Matrix [(cell_No+3)/3][0] = 1
                }
            }
        }
        else if cell_No == 22 {//王のかど
            if  boardMatrix[(cell_No-3)/3][1] >= 0 {
                possibleP2Matrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-6)/3][2] >= 0 && boardMatrix[(cell_No-3)/3][1] <= 0{
                    possibleP2Matrix [(cell_No-6)/3][2] = 1
                }
            }
        }
        else if cell_No == 24 {//王のかど
            if  boardMatrix[(cell_No-6)/3][1] >= 0 {
                possibleP2Matrix [(cell_No-6)/3][1] = 1
                if  boardMatrix[(cell_No-8)/3][0] >= 0 && boardMatrix[(cell_No-6)/3][1] <= 0{
                    possibleP2Matrix [(cell_No-8)/3][0] = 1
                }
            }
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
        
    }
    func callDragonHoseR(cell_No : Int){
        if  4 < cell_No && cell_No < 21 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[(cell_No-3)/3][0] >= 0 {possibleP2Matrix [(cell_No-3)/3][0] = 1}
            if  boardMatrix[(cell_No-3)/3][2] >= 0 {possibleP2Matrix [(cell_No-3)/3][2] = 1}
            if  boardMatrix[(cell_No+3)/3][0] >= 0 {possibleP2Matrix [(cell_No+3)/3][0] = 1}
            if  boardMatrix[(cell_No+3)/3][2] >= 0 {possibleP2Matrix [(cell_No+3)/3][2] = 1}
            if  boardMatrix[(cell_No-3)/3][1] >= 0 {possibleP2Matrix [(cell_No-3)/3][1] = 1}
            if  boardMatrix[(cell_No)/3][0] >= 0 {possibleP2Matrix [(cell_No)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][2] >= 0 {possibleP2Matrix [(cell_No)/3][2] = 1}
            if  boardMatrix[(cell_No+3)/3][1] >= 0 {possibleP2Matrix [(cell_No+3)/3][1] = 1}
            
        }
        else if  7 < cell_No && cell_No < 19 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No)/3][1] >= 0 {
                possibleP2Matrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No+3)/3][0] >= 0 && boardMatrix[(cell_No)/3][1] <= 0{
                    possibleP2Matrix [(cell_No+3)/3][0] = 1
                }
            }
            if  boardMatrix[(cell_No-6)/3][1] >= 0 {
                possibleP2Matrix [(cell_No-6)/3][1] = 1
                if  boardMatrix[(cell_No-8)/3][0] >= 0 && boardMatrix[(cell_No-6)/3][1] <= 0{
                    possibleP2Matrix [(cell_No-8)/3][0] = 1
                }
            }
            if  boardMatrix[(cell_No-4)/3][2] >= 0 {possibleP2Matrix [(cell_No-4)/3][2] = 1}
            if  boardMatrix[(cell_No-1)/3][1] >= 0 {possibleP2Matrix [(cell_No-1)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][2] >= 0 {possibleP2Matrix [(cell_No+2)/3][2] = 1}
        }
        else if  6 < cell_No && cell_No < 19 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No-3)/3][1] >= 0 {
                possibleP2Matrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-6)/3][2] >= 0 && boardMatrix[(cell_No-3)/3][1] <= 0{
                    possibleP2Matrix [(cell_No-6)/3][2] = 1
                }
            }
            if  boardMatrix[(cell_No+3)/3][1] >= 0 {
                possibleP2Matrix [(cell_No+3)/3][1] = 1
                if  boardMatrix[(cell_No+6)/3][2] >= 0 && boardMatrix[(cell_No+3)/3][1] <= 0{
                    possibleP2Matrix [(cell_No+6)/3][2] = 1
                }
            }
            if  boardMatrix[(cell_No-2)/3][0] >= 0 {possibleP2Matrix [(cell_No-2)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][1] >= 0 {possibleP2Matrix [(cell_No)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][0] >= 0 {possibleP2Matrix [(cell_No+2)/3][0] = 1}
        }
        else if cell_No == 2 {
            print("初期値")
            if  boardMatrix[1][2] >= 0 { possibleP2Matrix [1][2] = 1}
            if  boardMatrix[1][0] >= 0 { possibleP2Matrix [1][0] = 1}
            if  boardMatrix[0][0] >= 0 { possibleP2Matrix [0][0] = 1}
            if  boardMatrix[0][2] >= 0 { possibleP2Matrix [0][2] = 1}
            if  boardMatrix[1][1] >= 0 { possibleP2Matrix [1][1] = 1}
        }
        else if cell_No == 23 {
            if  boardMatrix[6][2] >= 0 { possibleP2Matrix [6][2] = 1}
            if  boardMatrix[6][0] >= 0 { possibleP2Matrix [6][0] = 1}
            if  boardMatrix[7][0] >= 0 { possibleP2Matrix [7][0] = 1}
            if  boardMatrix[7][2] >= 0 { possibleP2Matrix [7][2] = 1}
            if  boardMatrix[6][1] >= 0 { possibleP2Matrix [6][1] = 1}
        }
        else if cell_No == 4 {
            if  boardMatrix[(cell_No+3)/3][1] >= 0 {
                possibleP2Matrix [(cell_No+3)/3][1] = 1
                if  boardMatrix[(cell_No+6)/3][2] >= 0 && boardMatrix[(cell_No+3)/3][1] <= 0{
                    possibleP2Matrix [(cell_No+6)/3][2] = 1
                }
            }
            if  boardMatrix[0][1] >= 0 { possibleP2Matrix [0][1] = 1}
        }
        else if cell_No == 6 {
            if  boardMatrix[(cell_No)/3][1] >= 0 {
                possibleP2Matrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No+3)/3][0] >= 0 && boardMatrix[(cell_No)/3][1] <= 0{
                    possibleP2Matrix [(cell_No+3)/3][0] = 1
                }
            }
            if  boardMatrix[0][1] >= 0 { possibleP2Matrix [0][1] = 1}
        }
        else if cell_No == 21 {
            if  boardMatrix[(cell_No-6)/3][1] >= 0 {
                possibleP2Matrix [(cell_No-6)/3][1] = 1
                if  boardMatrix[(cell_No-8)/3][0] >= 0 && boardMatrix[(cell_No-6)/3][1] <= 0{
                    possibleP2Matrix [(cell_No-8)/3][0] = 1
                }
            }
            if  boardMatrix[7][1] >= 0 { possibleP2Matrix [7][1] = 1}
            if  boardMatrix[(cell_No-4)/3][2] >= 0 {possibleP2Matrix [(cell_No-4)/3][2] = 1}
            if  boardMatrix[(cell_No-1)/3][1] >= 0 {possibleP2Matrix [(cell_No-1)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][2] >= 0 {possibleP2Matrix [(cell_No+2)/3][2] = 1}
        }
        else if cell_No == 19 {
            if  boardMatrix[(cell_No-3)/3][1] >= 0 {
                possibleP2Matrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-6)/3][2] >= 0 && boardMatrix[(cell_No-3)/3][1] <= 0{
                    possibleP2Matrix [(cell_No-6)/3][2] = 1
                }
            }
            if  boardMatrix[7][1] >= 0 { possibleP2Matrix [7][1] = 1}
            if  boardMatrix[(cell_No-2)/3][0] >= 0 {possibleP2Matrix [(cell_No-2)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][1] >= 0 {possibleP2Matrix [(cell_No)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][0] >= 0 {possibleP2Matrix [(cell_No+2)/3][0] = 1}
        }
        else if cell_No == 1 {//王のかど
            if  boardMatrix[(cell_No+3)/3][1] >= 0 {
                possibleP2Matrix [(cell_No+3)/3][1] = 1
                if  boardMatrix[(cell_No+6)/3][2] >= 0 && boardMatrix[(cell_No+3)/3][1] <= 0{
                    possibleP2Matrix [(cell_No+6)/3][2] = 1
                }
            }
            if  boardMatrix[0][1] >= 0 { possibleP2Matrix [0][1] = 1}
            if  boardMatrix[1][0] >= 0 { possibleP2Matrix [1][0] = 1}
            
        }
        else if cell_No == 3 {//王のかど
            if  boardMatrix[(cell_No)/3][1] >= 0 {
                possibleP2Matrix [(cell_No)/3][1] = 1
                if  boardMatrix[(cell_No+3)/3][0] >= 0 && boardMatrix[(cell_No)/3][1] <= 0{
                    possibleP2Matrix [(cell_No+3)/3][0] = 1
                }
            }
            if  boardMatrix[0][1] >= 0 { possibleP2Matrix [0][1] = 1}
            if  boardMatrix[1][2] >= 0 { possibleP2Matrix [1][2] = 1}
        }
        else if cell_No == 22 {//王のかど
            if  boardMatrix[(cell_No-3)/3][1] >= 0 {
                possibleP2Matrix [(cell_No-3)/3][1] = 1
                if  boardMatrix[(cell_No-6)/3][2] >= 0 && boardMatrix[(cell_No-3)/3][1] <= 0{
                    possibleP2Matrix [(cell_No-6)/3][2] = 1
                }
            }
            if  boardMatrix[6][0] >= 0 { possibleP2Matrix [6][0] = 1}
            if  boardMatrix[7][1] >= 0 { possibleP2Matrix [7][1] = 1}
        }
        else if cell_No == 24 {//王のかど
            if  boardMatrix[(cell_No-6)/3][1] >= 0 {
                possibleP2Matrix [(cell_No-6)/3][1] = 1
                if  boardMatrix[(cell_No-8)/3][0] >= 0 && boardMatrix[(cell_No-6)/3][1] <= 0{
                    possibleP2Matrix [(cell_No-8)/3][0] = 1
                }
            }
            if  boardMatrix[6][2] >= 0 { possibleP2Matrix [6][2] = 1}
            if  boardMatrix[7][1] >= 0 { possibleP2Matrix [7][1] = 1}
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
        
    }
    func callCat(cell_No : Int){
        if  cell_No < 19{
            if  boardMatrix[((cell_No-1) / 3) + 1][(cell_No-1) % 3] <= 0 {
                possibleMatrix[((cell_No-1) / 3) + 1][(cell_No-1) % 3] = 1
                if  boardMatrix[((cell_No-1) / 3) + 2][(cell_No-1) % 3 ] <= 0 && boardMatrix[((cell_No-1) / 3) + 1][(cell_No-1) % 3] >= 0{
                    possibleMatrix[((cell_No-1) / 3) + 2][(cell_No-1) % 3]  = 1
                }
            }
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
        
    }
    func callCatR(cell_No : Int){
        if  cell_No > 6{
            if  boardMatrix[((cell_No-1) / 3) - 1][(cell_No-1) % 3] >= 0 {
                possibleP2Matrix[((cell_No-1) / 3) - 1][(cell_No-1) % 3] = 1
                if  boardMatrix[((cell_No-1) / 3) - 2][(cell_No-1) % 3 ] >= 0 && boardMatrix[((cell_No-1) / 3) - 1][(cell_No-1) % 3] <= 0{
                    possibleP2Matrix[((cell_No-1) / 3) - 2][(cell_No-1) % 3]  = 1
                }
            }
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
        
    }
    func callTiger(cell_No : Int){
        if  0 < cell_No && cell_No < 18 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[((cell_No-1) / 3) + 1][2] <= 0 {
                possibleMatrix[((cell_No-1) / 3) + 1][2] = 1
                if  boardMatrix[((cell_No-1) / 3) + 2][2] <= 0 && boardMatrix[((cell_No-1) / 3) + 1][2] >= 0{
                    possibleMatrix[((cell_No-1) / 3) + 2][2]  = 1
                }
            }
            if  boardMatrix[((cell_No-1) / 3) + 1][0] <= 0 {
                possibleMatrix[((cell_No-1) / 3) + 1][0] = 1
                if  boardMatrix[((cell_No-1) / 3) + 2][0] <= 0 && boardMatrix[((cell_No-1) / 3) + 1][0] >= 0{
                    possibleMatrix[((cell_No-1) / 3) + 2][0]  = 1
                }
            }
        }
        if cell_No == 20 {
            if  boardMatrix[7][2] <= 0 { possibleMatrix [7][2] = 1}
            if  boardMatrix[7][0] <= 0 { possibleMatrix [7][0] = 1}
        }
        else if  0 < cell_No && cell_No < 19 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[((cell_No-1) / 3) + 1][1] <= 0 {
                possibleMatrix[((cell_No-1) / 3) + 1][1] = 1
                if  boardMatrix[((cell_No-1) / 3) + 2][1] <= 0 && boardMatrix[((cell_No-1) / 3) + 1][1] >= 0{
                    possibleMatrix[((cell_No-1) / 3) + 2][1]  = 1
                }
            }
        }
        if cell_No == 21 {
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
        }
        else if  0 <= cell_No && cell_No < 18 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[((cell_No-1) / 3) + 1][1] <= 0 {
                possibleMatrix[((cell_No-1) / 3) + 1][1] = 1
                if  boardMatrix[((cell_No-1) / 3) + 2][1] <= 0 && boardMatrix[((cell_No-1) / 3) + 1][1] >= 0{
                    possibleMatrix[((cell_No-1) / 3) + 2][1]  = 1
                }
            }
        }
        if cell_No == 19 {
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
        }
        if cell_No > 3{
            if  boardMatrix[((cell_No-1) / 3) - 1][(cell_No-1) % 3] <= 0 {
                possibleMatrix [((cell_No-1) / 3) - 1][(cell_No-1) % 3] = 1
                lastCallX = ((cell_No-1) / 3)
                lastCallY = (cell_No-1) % 3
            }
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
        
    }
    func callTigerR(cell_No : Int){
        if  6 < cell_No && cell_No < 24 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[((cell_No-1) / 3) - 1][2] >= 0 {
                possibleP2Matrix[((cell_No-1) / 3) - 1][2] = 1
                if  boardMatrix[((cell_No-1) / 3) - 2][2] >= 0 && boardMatrix[((cell_No-1) / 3) - 1][2] <= 0{
                    possibleP2Matrix[((cell_No-1) / 3) - 2][2]  = 1
                }
            }
            if  boardMatrix[((cell_No-1) / 3) - 1][0] >= 0 {
                possibleP2Matrix[((cell_No-1) / 3) - 1][0] = 1
                if  boardMatrix[((cell_No-1) / 3) - 2][0] >= 0 && boardMatrix[((cell_No-1) / 3) - 1][0] <= 0{
                    possibleP2Matrix[((cell_No-1) / 3) - 2][0]  = 1
                }
            }
        }
        if cell_No == 5 {
            if  boardMatrix[0][2] >= 0 { possibleP2Matrix [0][2] = 1}
            if  boardMatrix[0][0] >= 0 { possibleP2Matrix [0][0] = 1}
        }
        else if  6 < cell_No && cell_No < 24 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[((cell_No-1) / 3) - 1][1] >= 0 {
                possibleP2Matrix[((cell_No-1) / 3) - 1][1] = 1
                if  boardMatrix[((cell_No-1) / 3) - 2][1] >= 0 && boardMatrix[((cell_No-1) / 3) - 1][1] <= 0{
                    possibleP2Matrix[((cell_No-1) / 3) - 2][1]  = 1
                }
            }
        }
        if cell_No == 6 {
            if  boardMatrix[0][1] <= 0 { possibleP2Matrix [0][1] = 1}
        }
        else if  7 <= cell_No && cell_No < 24 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[((cell_No-1) / 3) - 1][1] >= 0 {
                possibleP2Matrix[((cell_No-1) / 3) - 1][1] = 1
                if  boardMatrix[((cell_No-1) / 3) - 2][1] >= 0 && boardMatrix[((cell_No-1) / 3) - 1][1] <= 0{
                    possibleP2Matrix[((cell_No-1) / 3) - 2][1]  = 1
                }
            }
        }
        if cell_No == 4 {
            if  boardMatrix[0][1] <= 0 { possibleP2Matrix [0][1] = 1}
        }
        if cell_No < 22{
            if  boardMatrix[((cell_No-1) / 3) + 1][(cell_No-1) % 3] >= 0 {
                possibleP2Matrix [((cell_No-1) / 3) + 1][(cell_No-1) % 3] = 1
                lastCallX = ((cell_No-1) / 3)
                lastCallY = (cell_No-1) % 3
            }
        }
        lastCallX = ((cell_No-1) / 3)
        lastCallY = (cell_No-1) % 3
        
    }


    

    
    
    func handAdd(handNumber : Int){
        for x in 0...2{
            if play1Hold[x] == 0 && handNumber < -1 && handNumber != -7{
                play1Hold[x] = degenerationIndex[handNumber * -1]
                break
            }
        }
        if handNumber == -1 || handNumber == -7{
            play1Hold[3] = 1
            play1Hold[4] = play1Hold[4] + 1
        }
    }
    func handAdd2(handNumber : Int){
        for x in 0...2{
            if play2Hold[x] == 0 && handNumber > 1 && handNumber != 7{
                play2Hold[x] = degenerationIndex[handNumber]
                break
            }
        }
        if handNumber == 1 || handNumber ==
            7{
            play2Hold[3] = 1
            play2Hold[4] = play2Hold[4] + 1
        }
    }
    
    func plotPossible(){//移動可能なセルの色を変更
        if possibleMatrix[0][0] == 1 {buttns1.backgroundColor = UIColor.red}else{buttns1.backgroundColor = UIColor.brown}
        if possibleMatrix[0][1] == 1 {buttns2.backgroundColor = UIColor.red}else{buttns2.backgroundColor = UIColor.brown}
        if possibleMatrix[0][2] == 1 {buttns3.backgroundColor = UIColor.red}else{buttns3.backgroundColor = UIColor.brown}
        if possibleMatrix[1][0] == 1 {buttns4.backgroundColor = UIColor.red}else{buttns4.backgroundColor = UIColor.brown}
        if possibleMatrix[1][1] == 1 {buttns5.backgroundColor = UIColor.red}else{buttns5.backgroundColor = UIColor.brown}
        if possibleMatrix[1][2] == 1 {buttns6.backgroundColor = UIColor.red}else{buttns6.backgroundColor = UIColor.brown}
        if possibleMatrix[2][0] == 1 {buttns7.backgroundColor = UIColor.red}else{buttns7.backgroundColor = UIColor.brown}
        if possibleMatrix[2][1] == 1 {buttns8.backgroundColor = UIColor.red}else{buttns8.backgroundColor = UIColor.brown}
        if possibleMatrix[2][2] == 1 {buttns9.backgroundColor = UIColor.red}else{buttns9.backgroundColor = UIColor.brown}
        if possibleMatrix[3][0] == 1 {buttns10.backgroundColor = UIColor.red}else{buttns10.backgroundColor = UIColor.brown}
        if possibleMatrix[3][1] == 1 {buttns11.backgroundColor = UIColor.red}else{buttns11.backgroundColor = UIColor.brown}
        if possibleMatrix[3][2] == 1 {buttns12.backgroundColor = UIColor.red}else{buttns12.backgroundColor = UIColor.brown}
        if possibleMatrix[4][0] == 1 {buttns13.backgroundColor = UIColor.red}else{buttns13.backgroundColor = UIColor.brown}
        if possibleMatrix[4][1] == 1 {buttns14.backgroundColor = UIColor.red}else{buttns14.backgroundColor = UIColor.brown}
        if possibleMatrix[4][2] == 1 {buttns15.backgroundColor = UIColor.red}else{buttns15.backgroundColor = UIColor.brown}
        if possibleMatrix[5][0] == 1 {buttns16.backgroundColor = UIColor.red}else{buttns16.backgroundColor = UIColor.brown}
        if possibleMatrix[5][1] == 1 {buttns17.backgroundColor = UIColor.red}else{buttns17.backgroundColor = UIColor.brown}
        if possibleMatrix[5][2] == 1 {buttns18.backgroundColor = UIColor.red}else{buttns18.backgroundColor = UIColor.brown}
        if possibleMatrix[6][0] == 1 {buttns19.backgroundColor = UIColor.red}else{buttns19.backgroundColor = UIColor.brown}
        if possibleMatrix[6][1] == 1 {buttns20.backgroundColor = UIColor.red}else{buttns20.backgroundColor = UIColor.brown}
        if possibleMatrix[6][2] == 1 {buttns21.backgroundColor = UIColor.red}else{buttns21.backgroundColor = UIColor.brown}
        if possibleMatrix[7][0] == 1 {buttns22.backgroundColor = UIColor.red}else{buttns22.backgroundColor = UIColor.brown}
        if possibleMatrix[7][1] == 1 {buttns23.backgroundColor = UIColor.red}else{buttns23.backgroundColor = UIColor.brown}
        if possibleMatrix[7][2] == 1 {buttns24.backgroundColor = UIColor.red}else{buttns24.backgroundColor = UIColor.brown}

    }
    func plotPossible2(){//移動可能なセルの色を変更
        if possibleP2Matrix[0][0] == 1 {buttns1.backgroundColor = UIColor.blue}else{buttns1.backgroundColor = UIColor.brown}
        if possibleP2Matrix[0][1] == 1 {buttns2.backgroundColor = UIColor.blue}else{buttns2.backgroundColor = UIColor.brown}
        if possibleP2Matrix[0][2] == 1 {buttns3.backgroundColor = UIColor.blue}else{buttns3.backgroundColor = UIColor.brown}
        if possibleP2Matrix[1][0] == 1 {buttns4.backgroundColor = UIColor.blue}else{buttns4.backgroundColor = UIColor.brown}
        if possibleP2Matrix[1][1] == 1 {buttns5.backgroundColor = UIColor.blue}else{buttns5.backgroundColor = UIColor.brown}
        if possibleP2Matrix[1][2] == 1 {buttns6.backgroundColor = UIColor.blue}else{buttns6.backgroundColor = UIColor.brown}
        if possibleP2Matrix[2][0] == 1 {buttns7.backgroundColor = UIColor.blue}else{buttns7.backgroundColor = UIColor.brown}
        if possibleP2Matrix[2][1] == 1 {buttns8.backgroundColor = UIColor.blue}else{buttns8.backgroundColor = UIColor.brown}
        if possibleP2Matrix[2][2] == 1 {buttns9.backgroundColor = UIColor.blue}else{buttns9.backgroundColor = UIColor.brown}
        if possibleP2Matrix[3][0] == 1 {buttns10.backgroundColor = UIColor.blue}else{buttns10.backgroundColor = UIColor.brown}
        if possibleP2Matrix[3][1] == 1 {buttns11.backgroundColor = UIColor.blue}else{buttns11.backgroundColor = UIColor.brown}
        if possibleP2Matrix[3][2] == 1 {buttns12.backgroundColor = UIColor.blue}else{buttns12.backgroundColor = UIColor.brown}
        if possibleP2Matrix[4][0] == 1 {buttns13.backgroundColor = UIColor.blue}else{buttns13.backgroundColor = UIColor.brown}
        if possibleP2Matrix[4][1] == 1 {buttns14.backgroundColor = UIColor.blue}else{buttns14.backgroundColor = UIColor.brown}
        if possibleP2Matrix[4][2] == 1 {buttns15.backgroundColor = UIColor.blue}else{buttns15.backgroundColor = UIColor.brown}
        if possibleP2Matrix[5][0] == 1 {buttns16.backgroundColor = UIColor.blue}else{buttns16.backgroundColor = UIColor.brown}
        if possibleP2Matrix[5][1] == 1 {buttns17.backgroundColor = UIColor.blue}else{buttns17.backgroundColor = UIColor.brown}
        if possibleP2Matrix[5][2] == 1 {buttns18.backgroundColor = UIColor.blue}else{buttns18.backgroundColor = UIColor.brown}
        if possibleP2Matrix[6][0] == 1 {buttns19.backgroundColor = UIColor.blue}else{buttns19.backgroundColor = UIColor.brown}
        if possibleP2Matrix[6][1] == 1 {buttns20.backgroundColor = UIColor.blue}else{buttns20.backgroundColor = UIColor.brown}
        if possibleP2Matrix[6][2] == 1 {buttns21.backgroundColor = UIColor.blue}else{buttns21.backgroundColor = UIColor.brown}
        if possibleP2Matrix[7][0] == 1 {buttns22.backgroundColor = UIColor.blue}else{buttns22.backgroundColor = UIColor.brown}
        if possibleP2Matrix[7][1] == 1 {buttns23.backgroundColor = UIColor.blue}else{buttns23.backgroundColor = UIColor.brown}
        if possibleP2Matrix[7][2] == 1 {buttns24.backgroundColor = UIColor.blue}else{buttns24.backgroundColor = UIColor.brown}
        
    }

    
    /*func evolve(cell_No : Int){
        for x in 5...7{
            for y in 0...2{
                if boardMatrix[x][y] == 1 {boardMatrix[x][y] = 7}
                if 4 <= boardMatrix[x][y] && boardMatrix[x][y] <= 6 {boardMatrix[x][y] = boardMatrix[x][y] + 5}
                if boardMatrix[x][y] == 12 {boardMatrix[x][y] = 13}
                if boardMatrix[x][y] == 14 {boardMatrix[x][y] = 15}
                if boardMatrix[x][y] == 16 {boardMatrix[x][y] = 17}
            }
        }
    }
    func evolve2(cell_No : Int){
        for x in 0...2{
            for y in 0...2{
                if boardMatrix[x][y] == -1 {boardMatrix[x][y] = -7}
                if -6 <= boardMatrix[x][y] && boardMatrix[x][y] <= -4 {
                    boardMatrix[x][y] = boardMatrix[x][y] - 5
                }
                if boardMatrix[x][y] == -12 {boardMatrix[x][y] = -13}
                if boardMatrix[x][y] == -14 {boardMatrix[x][y] = -15}
                if boardMatrix[x][y] == -16 {boardMatrix[x][y] = -17}
            }
        }
    }*/
    func evolve(cell_No : Int){
        if cell_No > 15 {
            if boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] == 1 {boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] = 7}
            if 4 <= boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] && boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] <= 6 {boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] = boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] + 5}
            if boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] == 12 {boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] = 13}
            if boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] == 14 {boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] = 15}
            if boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] == 16 {boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] = 17}
        }
    }
     func evolve2(cell_No : Int){
        if cell_No < 10 {
            if boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] == -1 {boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] = -7}
            if -6 <= boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] && boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] <= -4 {boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] = boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] - 5}
            if boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] == -12 {boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] = -13}
            if boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] == -14 {boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] = -15}
            if boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] == -16 {boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3] = -17}
        }
     }
    
    func plotKoma(){//駒の画像をプロット
        for x in 0...komaKazu{//駒が追加されたらこのfar文も長くする
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
            if boardMatrix[2][0] >= 1 && boardMatrix[2][0] == x+1 {
                komaImg7.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[2][0] == 0 {komaImg7.image = UIImage(named : "koma2.png")}
            if boardMatrix[2][1] >= 1 && boardMatrix[2][1] == x+1 {
                komaImg8.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[2][1] == 0 {komaImg8.image = UIImage(named : "koma2.png")}
            if boardMatrix[2][2] >= 1 && boardMatrix[2][2] == x+1 {
                komaImg9.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[2][2] == 0 {komaImg9.image = UIImage(named : "koma2.png")}
            //---
            if boardMatrix[3][0] >= 1 && boardMatrix[3][0] == x+1 {
                komaImg10.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[3][0] == 0 {komaImg10.image = UIImage(named : "koma2.png")}
            if boardMatrix[3][1] >= 1 && boardMatrix[3][1] == x+1 {
                komaImg11.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[3][1] == 0 {komaImg11.image = UIImage(named : "koma2.png")}
            if boardMatrix[3][2] >= 1 && boardMatrix[3][2] == x+1 {
                komaImg12.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[3][2] == 0 {komaImg12.image = UIImage(named : "koma2.png")}
            //----
            if boardMatrix[4][0] >= 1 && boardMatrix[4][0] == x+1 {
                komaImg13.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[4][0] == 0 {komaImg13.image = UIImage(named : "koma2.png")}
            if boardMatrix[4][1] >= 1 && boardMatrix[4][1] == x+1 {
                komaImg14.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[4][1] == 0 {komaImg14.image = UIImage(named : "koma2.png")}
            if boardMatrix[4][2] >= 1 && boardMatrix[4][2] == x+1 {
                komaImg15.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[4][2] == 0 {komaImg15.image = UIImage(named : "koma2.png")}
            //----
            if boardMatrix[5][0] >= 1 && boardMatrix[5][0] == x+1 {
                komaImg16.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[5][0] == 0 {komaImg16.image = UIImage(named : "koma2.png")}
            if boardMatrix[5][1] >= 1 && boardMatrix[5][1] == x+1 {
                komaImg17.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[5][1] == 0 {komaImg17.image = UIImage(named : "koma2.png")}
            if boardMatrix[5][2] >= 1 && boardMatrix[5][2] == x+1 {
                komaImg18.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[5][2] == 0 {komaImg18.image = UIImage(named : "koma2.png")}
            //----
            if boardMatrix[6][0] >= 1 && boardMatrix[6][0] == x+1 {
                komaImg19.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[6][0] == 0 {komaImg19.image = UIImage(named : "koma2.png")}
            if boardMatrix[6][1] >= 1 && boardMatrix[6][1] == x+1 {
                komaImg20.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[6][1] == 0 {komaImg20.image = UIImage(named : "koma2.png")}
            if boardMatrix[6][2] >= 1 && boardMatrix[6][2] == x+1 {
                komaImg21.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[6][2] == 0 {komaImg21.image = UIImage(named : "koma2.png")}
            //----
            if boardMatrix[7][0] >= 1 && boardMatrix[7][0] == x+1 {
                komaImg22.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[7][0] == 0 {komaImg22.image = UIImage(named : "koma2.png")}
            if boardMatrix[7][1] >= 1 && boardMatrix[7][1] == x+1 {
                komaImg23.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[7][1] == 0 {komaImg23.image = UIImage(named : "koma2.png")}
            if boardMatrix[7][2] >= 1 && boardMatrix[7][2] == x+1 {
                komaImg24.image = UIImage(named : komaImageIndex[x])
            }
            else if boardMatrix[7][2] == 0 {komaImg24.image = UIImage(named : "koma2.png")}
            //----
        }
        for x in -1 * komaKazu ... -1{//駒が追加されたらこのfar文も長くする
            if boardMatrix[0][0] == x {
                komaImg1.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[0][0] == 0 {komaImg1.image = UIImage(named : "koma2.png")}
            if boardMatrix[0][1] == x {
                komaImg2.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[0][1] == 0 {komaImg2.image = UIImage(named : "koma2.png")}
            if boardMatrix[0][2] == x {
                komaImg3.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[0][2] == 0 {komaImg3.image = UIImage(named : "koma2.png")}
            //----
            if boardMatrix[1][0] == x {
                komaImg4.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[1][0] == 0 {komaImg4.image = UIImage(named : "koma2.png")}
            if boardMatrix[1][1] == x {
                komaImg5.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[1][1] == 0 {komaImg5.image = UIImage(named : "koma2.png")}
            if boardMatrix[1][2] == x {
                komaImg6.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[1][2] == 0 {komaImg6.image = UIImage(named : "koma2.png")}
            //---
            if boardMatrix[2][0] == x {
                komaImg7.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[2][0] == 0 {komaImg7.image = UIImage(named : "koma2.png")}
            if boardMatrix[2][1] == x {
                komaImg8.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[2][1] == 0 {komaImg8.image = UIImage(named : "koma2.png")}
            if boardMatrix[2][2] == x {
                komaImg9.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[2][2] == 0 {komaImg9.image = UIImage(named : "koma2.png")}
            //---
            if boardMatrix[3][0] == x {
                komaImg10.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[3][0] == 0 {komaImg10.image = UIImage(named : "koma2.png")}
            if  boardMatrix[3][1] == x {
                komaImg11.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[3][1] == 0 {komaImg11.image = UIImage(named : "koma2.png")}
            if  boardMatrix[3][2] == x {
                komaImg12.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[3][2] == 0 {komaImg12.image = UIImage(named : "koma2.png")}
            //----
            if boardMatrix[4][0] == x {
                komaImg13.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[4][0] == 0 {komaImg13.image = UIImage(named : "koma2.png")}
            if boardMatrix[4][1] == x {
                komaImg14.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[4][1] == 0 {komaImg14.image = UIImage(named : "koma2.png")}
            if  boardMatrix[4][2] == x {
                komaImg15.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[4][2] == 0 {komaImg15.image = UIImage(named : "koma2.png")}
            //----
            if  boardMatrix[5][0] == x {
                komaImg16.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[5][0] == 0 {komaImg16.image = UIImage(named : "koma2.png")}
            if boardMatrix[5][1] == x {
                komaImg17.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[5][1] == 0 {komaImg17.image = UIImage(named : "koma2.png")}
            if boardMatrix[5][2] == x {
                komaImg18.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[5][2] == 0 {komaImg18.image = UIImage(named : "koma2.png")}
            //----
            if boardMatrix[6][0] == x {
                komaImg19.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[6][0] == 0 {komaImg19.image = UIImage(named : "koma2.png")}
            if boardMatrix[6][1] == x {
                komaImg20.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[6][1] == 0 {komaImg20.image = UIImage(named : "koma2.png")}
            if boardMatrix[6][2] == x {
                komaImg21.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[6][2] == 0 {komaImg21.image = UIImage(named : "koma2.png")}
            //----
            if  boardMatrix[7][0] == x {
                komaImg22.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[7][0] == 0 {komaImg22.image = UIImage(named : "koma2.png")}
            if boardMatrix[7][1] == x {
                komaImg23.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[7][1] == 0 {komaImg23.image = UIImage(named : "koma2.png")}
            if  boardMatrix[7][2] == x {
                komaImg24.image = UIImage(named : r_komaImageIndex[(x * -1) - 1])
            }
            else if boardMatrix[7][2] == 0 {komaImg24.image = UIImage(named : "koma2.png")}
            //----
        }
    }
    func plotHandKoma(){//駒の画像をプロット
        for x in 1...komaKazu{//駒が追加されたらこのfar文も長くする
            if play1Hold[0] == x {
                handKomaImg1.image = UIImage(named : komaImageIndex[x-1])
            }
            else if play1Hold[0] == 0 {handKomaImg1.image = UIImage(named : "koma2.png")}
            if play1Hold[1] == x {
                handKomaImg2.image = UIImage(named : komaImageIndex[x-1])
            }
            else if play1Hold[1] == 0 {handKomaImg2.image = UIImage(named : "koma2.png")}
            if play1Hold[2] == x {
                handKomaImg3.image = UIImage(named : komaImageIndex[x-1])
            }
            else if play1Hold[2] == 0 {handKomaImg3.image = UIImage(named : "koma2.png")}
            if play1Hold[3] == x {
                handKomaImg4.image = UIImage(named : komaImageIndex[x-1])
            }
            else if play1Hold[3] == 0 {handKomaImg4.image = UIImage(named : "koma2.png")}
        }
        
        holdingHu1.text = String(play1Hold[4])
        
    }
    func plotHandKoma2(){//駒の画像をプロット
        for x in 1...komaKazu{//駒が追加されたらこのfar文も長くする
            if play2Hold[0] == x {
                handKomaImg5.image = UIImage(named : r_komaImageIndex[x-1])
            }
            else if play2Hold[0] == 0 {handKomaImg5.image = UIImage(named : "koma2.png")}
            if play2Hold[1] == x {
                handKomaImg6.image = UIImage(named : r_komaImageIndex[x-1])
            }
            else if play2Hold[1] == 0 {handKomaImg6.image = UIImage(named : "koma2.png")}
            if play2Hold[2] == x {
                handKomaImg7.image = UIImage(named : r_komaImageIndex[x-1])
            }
            else if play2Hold[2] == 0 {handKomaImg7.image = UIImage(named : "koma2.png")}
            if play2Hold[3] == x {
                handKomaImg8.image = UIImage(named : r_komaImageIndex[x-1])
            }
            else if play2Hold[3] == 0 {handKomaImg8.image = UIImage(named : "koma2.png")}
        }
        
        holdingHu2.text = String(play2Hold[4])
        
    }
    
    func searchCanPut(flag : Int){
        var soundIdRing:SystemSoundID = 0
        if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "cursor", ofType:"mp3")!) as NSURL?{
            AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
            AudioServicesPlaySystemSound(soundIdRing)
        }
        possibleMatrix = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
        possibleP2Matrix = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
        possiblePutMatrix = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
        possibleP2PutMatrix = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
        allClear()
        var line1 : Bool = true//
        var line2 : Bool = true//
        var line3 : Bool = true//
        for x in 0...7{
            for y in 0...2{
                if boardMatrix[x][y] == 0{
                    possiblePutMatrix[x][y] = 1
                }
                if boardMatrix[x][y] == 1{//
                    if y==0{line1=false}//
                    if y==1{line2=false}//
                    if y==2{line3=false}//
                }//
            }
        }
        if flag == 1{
            if possiblePutMatrix[0][0] == 1 {buttns1.backgroundColor = UIColor.red}else{buttns1.backgroundColor = UIColor.brown}
            if possiblePutMatrix[0][1] == 1 {buttns2.backgroundColor = UIColor.red}else{buttns2.backgroundColor = UIColor.brown}
            if possiblePutMatrix[0][2] == 1 {buttns3.backgroundColor = UIColor.red}else{buttns3.backgroundColor = UIColor.brown}
            if possiblePutMatrix[1][0] == 1 {buttns4.backgroundColor = UIColor.red}else{buttns4.backgroundColor = UIColor.brown}
            if possiblePutMatrix[1][1] == 1 {buttns5.backgroundColor = UIColor.red}else{buttns5.backgroundColor = UIColor.brown}
            if possiblePutMatrix[1][2] == 1 {buttns6.backgroundColor = UIColor.red}else{buttns6.backgroundColor = UIColor.brown}
            if possiblePutMatrix[2][0] == 1 {buttns7.backgroundColor = UIColor.red}else{buttns7.backgroundColor = UIColor.brown}
            if possiblePutMatrix[2][1] == 1 {buttns8.backgroundColor = UIColor.red}else{buttns8.backgroundColor = UIColor.brown}
            if possiblePutMatrix[2][2] == 1 {buttns9.backgroundColor = UIColor.red}else{buttns9.backgroundColor = UIColor.brown}
            if possiblePutMatrix[3][0] == 1 {buttns10.backgroundColor = UIColor.red}else{buttns10.backgroundColor = UIColor.brown}
            if possiblePutMatrix[3][1] == 1 {buttns11.backgroundColor = UIColor.red}else{buttns11.backgroundColor = UIColor.brown}
            if possiblePutMatrix[3][2] == 1 {buttns12.backgroundColor = UIColor.red}else{buttns12.backgroundColor = UIColor.brown}
            if possiblePutMatrix[4][0] == 1 {buttns13.backgroundColor = UIColor.red}else{buttns13.backgroundColor = UIColor.brown}
            if possiblePutMatrix[4][1] == 1 {buttns14.backgroundColor = UIColor.red}else{buttns14.backgroundColor = UIColor.brown}
            if possiblePutMatrix[4][2] == 1 {buttns15.backgroundColor = UIColor.red}else{buttns15.backgroundColor = UIColor.brown}
            if possiblePutMatrix[5][0] == 1 {buttns16.backgroundColor = UIColor.red}else{buttns16.backgroundColor = UIColor.brown}
            if possiblePutMatrix[5][1] == 1 {buttns17.backgroundColor = UIColor.red}else{buttns17.backgroundColor = UIColor.brown}
            if possiblePutMatrix[5][2] == 1 {buttns18.backgroundColor = UIColor.red}else{buttns18.backgroundColor = UIColor.brown}
            if possiblePutMatrix[6][0] == 1 {buttns19.backgroundColor = UIColor.red}else{buttns19.backgroundColor = UIColor.brown}
            if possiblePutMatrix[6][1] == 1 {buttns20.backgroundColor = UIColor.red}else{buttns20.backgroundColor = UIColor.brown}
            if possiblePutMatrix[6][2] == 1 {buttns21.backgroundColor = UIColor.red}else{buttns21.backgroundColor = UIColor.brown}
            if possiblePutMatrix[7][0] == 1 {buttns22.backgroundColor = UIColor.red}else{buttns22.backgroundColor = UIColor.brown}
            if possiblePutMatrix[7][1] == 1 {buttns23.backgroundColor = UIColor.red}else{buttns23.backgroundColor = UIColor.brown}
            if possiblePutMatrix[7][2] == 1 {buttns24.backgroundColor = UIColor.red}else{buttns24.backgroundColor = UIColor.brown}
        }
        if flag == 0{
            if line1{
                if possiblePutMatrix[0][0] == 1 {buttns1.backgroundColor = UIColor.red}else{buttns1.backgroundColor = UIColor.brown}
                if possiblePutMatrix[1][0] == 1 {buttns4.backgroundColor = UIColor.red}else{buttns4.backgroundColor = UIColor.brown}
                if possiblePutMatrix[2][0] == 1 {buttns7.backgroundColor = UIColor.red}else{buttns7.backgroundColor = UIColor.brown}
                if possiblePutMatrix[3][0] == 1 {buttns10.backgroundColor = UIColor.red}else{buttns10.backgroundColor = UIColor.brown}
                if possiblePutMatrix[4][0] == 1 {buttns13.backgroundColor = UIColor.red}else{buttns13.backgroundColor = UIColor.brown}
                if possiblePutMatrix[5][0] == 1 {buttns16.backgroundColor = UIColor.red}else{buttns16.backgroundColor = UIColor.brown}
                if possiblePutMatrix[6][0] == 1 {buttns19.backgroundColor = UIColor.red}else{buttns19.backgroundColor = UIColor.brown}
                if possiblePutMatrix[7][0] == 1 {buttns22.backgroundColor = UIColor.red}else{buttns22.backgroundColor = UIColor.brown}
            }
            if line2{
                
                if possiblePutMatrix[0][1] == 1 {buttns2.backgroundColor = UIColor.red}else{buttns2.backgroundColor = UIColor.brown}
                if possiblePutMatrix[1][1] == 1 {buttns5.backgroundColor = UIColor.red}else{buttns5.backgroundColor = UIColor.brown}
                if possiblePutMatrix[2][1] == 1 {buttns8.backgroundColor = UIColor.red}else{buttns8.backgroundColor = UIColor.brown}
                if possiblePutMatrix[3][1] == 1 {buttns11.backgroundColor = UIColor.red}else{buttns11.backgroundColor = UIColor.brown}
                if possiblePutMatrix[4][1] == 1 {buttns14.backgroundColor = UIColor.red}else{buttns14.backgroundColor = UIColor.brown}
                if possiblePutMatrix[5][1] == 1 {buttns17.backgroundColor = UIColor.red}else{buttns17.backgroundColor = UIColor.brown}
                if possiblePutMatrix[6][1] == 1 {buttns20.backgroundColor = UIColor.red}else{buttns20.backgroundColor = UIColor.brown}
                if possiblePutMatrix[7][1] == 1 {buttns23.backgroundColor = UIColor.red}else{buttns23.backgroundColor = UIColor.brown}
            }
            if line3{
                
                if possiblePutMatrix[0][2] == 1 {buttns3.backgroundColor = UIColor.red}else{buttns3.backgroundColor = UIColor.brown}
                if possiblePutMatrix[1][2] == 1 {buttns6.backgroundColor = UIColor.red}else{buttns6.backgroundColor = UIColor.brown}
                if possiblePutMatrix[2][2] == 1 {buttns9.backgroundColor = UIColor.red}else{buttns9.backgroundColor = UIColor.brown}
                if possiblePutMatrix[3][2] == 1 {buttns12.backgroundColor = UIColor.red}else{buttns12.backgroundColor = UIColor.brown}
                if possiblePutMatrix[4][2] == 1 {buttns15.backgroundColor = UIColor.red}else{buttns15.backgroundColor = UIColor.brown}
                if possiblePutMatrix[5][2] == 1 {buttns18.backgroundColor = UIColor.red}else{buttns18.backgroundColor = UIColor.brown}
                if possiblePutMatrix[6][2] == 1 {buttns21.backgroundColor = UIColor.red}else{buttns21.backgroundColor = UIColor.brown}
                if possiblePutMatrix[7][2] == 1 {buttns24.backgroundColor = UIColor.red}else{buttns24.backgroundColor = UIColor.brown}
            }
        }
    }
    
    func searchCanPut2(flag : Int){
        var soundIdRing:SystemSoundID = 0
        if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "cursor", ofType:"mp3")!) as NSURL?{
            AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
            AudioServicesPlaySystemSound(soundIdRing)
        }
        possibleMatrix = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
        possibleP2Matrix = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
        possiblePutMatrix = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
        possibleP2PutMatrix = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
        allClear()
        var line1 : Bool = true//
        var line2 : Bool = true//
        var line3 : Bool = true//
        
        for x in 0...7{
            for y in 0...2{
                if boardMatrix[x][y] == 0{
                    possibleP2PutMatrix[x][y] = 1
                }
                if boardMatrix[x][y] == -1{//
                    if y==0{line1=false}//
                    if y==1{line2=false}//
                    if y==2{line3=false}//
                }//
            }
        }
        if flag == 1{
            if possibleP2PutMatrix[0][0] == 1 {buttns1.backgroundColor = UIColor.blue}else{buttns1.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[0][1] == 1 {buttns2.backgroundColor = UIColor.blue}else{buttns2.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[0][2] == 1 {buttns3.backgroundColor = UIColor.blue}else{buttns3.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[1][0] == 1 {buttns4.backgroundColor = UIColor.blue}else{buttns4.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[1][1] == 1 {buttns5.backgroundColor = UIColor.blue}else{buttns5.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[1][2] == 1 {buttns6.backgroundColor = UIColor.blue}else{buttns6.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[2][0] == 1 {buttns7.backgroundColor = UIColor.blue}else{buttns7.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[2][1] == 1 {buttns8.backgroundColor = UIColor.blue}else{buttns8.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[2][2] == 1 {buttns9.backgroundColor = UIColor.blue}else{buttns9.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[3][0] == 1 {buttns10.backgroundColor = UIColor.blue}else{buttns10.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[3][1] == 1 {buttns11.backgroundColor = UIColor.blue}else{buttns11.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[3][2] == 1 {buttns12.backgroundColor = UIColor.blue}else{buttns12.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[4][0] == 1 {buttns13.backgroundColor = UIColor.blue}else{buttns13.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[4][1] == 1 {buttns14.backgroundColor = UIColor.blue}else{buttns14.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[4][2] == 1 {buttns15.backgroundColor = UIColor.blue}else{buttns15.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[5][0] == 1 {buttns16.backgroundColor = UIColor.blue}else{buttns16.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[5][1] == 1 {buttns17.backgroundColor = UIColor.blue}else{buttns17.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[5][2] == 1 {buttns18.backgroundColor = UIColor.blue}else{buttns18.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[6][0] == 1 {buttns19.backgroundColor = UIColor.blue}else{buttns19.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[6][1] == 1 {buttns20.backgroundColor = UIColor.blue}else{buttns20.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[6][2] == 1 {buttns21.backgroundColor = UIColor.blue}else{buttns21.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[7][0] == 1 {buttns22.backgroundColor = UIColor.blue}else{buttns22.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[7][1] == 1 {buttns23.backgroundColor = UIColor.blue}else{buttns23.backgroundColor = UIColor.brown}
            if possibleP2PutMatrix[7][2] == 1 {buttns24.backgroundColor = UIColor.blue}else{buttns24.backgroundColor = UIColor.brown}
        }
        if flag == 0{
            if line1{
                if possibleP2PutMatrix[0][0] == 1 {buttns1.backgroundColor = UIColor.blue}else{buttns1.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[1][0] == 1 {buttns4.backgroundColor = UIColor.blue}else{buttns4.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[2][0] == 1 {buttns7.backgroundColor = UIColor.blue}else{buttns7.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[3][0] == 1 {buttns10.backgroundColor = UIColor.blue}else{buttns10.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[4][0] == 1 {buttns13.backgroundColor = UIColor.blue}else{buttns13.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[5][0] == 1 {buttns16.backgroundColor = UIColor.blue}else{buttns16.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[6][0] == 1 {buttns19.backgroundColor = UIColor.blue}else{buttns19.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[7][0] == 1 {buttns22.backgroundColor = UIColor.blue}else{buttns22.backgroundColor = UIColor.brown}
            }
            if line2{
                if possibleP2PutMatrix[0][1] == 1 {buttns2.backgroundColor = UIColor.blue}else{buttns2.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[1][1] == 1 {buttns5.backgroundColor = UIColor.blue}else{buttns5.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[2][1] == 1 {buttns8.backgroundColor = UIColor.blue}else{buttns8.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[3][1] == 1 {buttns11.backgroundColor = UIColor.blue}else{buttns11.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[4][1] == 1 {buttns14.backgroundColor = UIColor.blue}else{buttns14.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[5][1] == 1 {buttns17.backgroundColor = UIColor.blue}else{buttns17.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[6][1] == 1 {buttns20.backgroundColor = UIColor.blue}else{buttns20.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[7][1] == 1 {buttns23.backgroundColor = UIColor.blue}else{buttns23.backgroundColor = UIColor.brown}
            }
            if line3{
                if possibleP2PutMatrix[0][2] == 1 {buttns3.backgroundColor = UIColor.blue}else{buttns3.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[1][2] == 1 {buttns6.backgroundColor = UIColor.blue}else{buttns6.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[2][2] == 1 {buttns9.backgroundColor = UIColor.blue}else{buttns9.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[3][2] == 1 {buttns12.backgroundColor = UIColor.blue}else{buttns12.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[4][2] == 1 {buttns15.backgroundColor = UIColor.blue}else{buttns15.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[5][2] == 1 {buttns18.backgroundColor = UIColor.blue}else{buttns18.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[6][2] == 1 {buttns21.backgroundColor = UIColor.blue}else{buttns21.backgroundColor = UIColor.brown}
                if possibleP2PutMatrix[7][2] == 1 {buttns24.backgroundColor = UIColor.blue}else{buttns24.backgroundColor = UIColor.brown}
            }
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
    @IBAction func tap7(){
        tap(cell_No: 7)
    }
    @IBAction func tap8(){
        tap(cell_No: 8)
    }
    @IBAction func tap9(){
        tap(cell_No: 9)
    }
    @IBAction func tap10(){
        tap(cell_No: 10)
    }
    @IBAction func tap11(){
        tap(cell_No: 11)
    }
    @IBAction func tap12(){
        tap(cell_No: 12)
    }
    @IBAction func tap13(){
        tap(cell_No: 13)
    }
    @IBAction func tap14(){
        tap(cell_No: 14)
    }
    @IBAction func tap15(){
        tap(cell_No: 15)
    }
    @IBAction func tap16(){
        tap(cell_No: 16)
    }
    @IBAction func tap17(){
        tap(cell_No: 17)
    }
    @IBAction func tap18(){
        tap(cell_No: 18)
    }
    @IBAction func tap19(){
        tap(cell_No: 19)
    }
    @IBAction func tap20(){
        tap(cell_No: 20)
    }
    @IBAction func tap21(){
        tap(cell_No: 21)
    }
    @IBAction func tap22(){
        tap(cell_No: 22)
    }
    @IBAction func tap23(){
        tap(cell_No: 23)
    }
    @IBAction func tap24(){
        tap(cell_No: 24)
    }
    
    @IBAction func summon1(){
        if play1Hold[0] != 0 && turn == true{
            protHandClear()
            handButtns1.backgroundColor = UIColor.red
            putNumber[0] = play1Hold[0]
            putNumber[1] = 0
            searchCanPut(flag : 1)
        }
        
    }
    @IBAction func summon2(){
        if play1Hold[1] != 0 && turn == true{
            protHandClear()
            handButtns2.backgroundColor = UIColor.red
            putNumber[0] = play1Hold[1]
            putNumber[1] = 1
            searchCanPut(flag : 1)
        }
    }
    @IBAction func summon3(){
        if play1Hold[2] != 0 && turn == true{
            protHandClear()
            handButtns3.backgroundColor = UIColor.red
            putNumber[0] = play1Hold[2]
            putNumber[1] = 2
            searchCanPut(flag : 1)
        }
    }
    @IBAction func summon4(){
        if play1Hold[3] != 0 && turn == true{
            protHandClear()
            handButtns4.backgroundColor = UIColor.red
            putNumber[0] = play1Hold[3]
            putNumber[1] = 3
            searchCanPut(flag : 0)
        }
    }
    @IBAction func summon5(){
        if play2Hold[0] != 0 && turn == false{
            protHandClear()
            handButtns5.backgroundColor = UIColor.blue
            putNumber[0] = play2Hold[0]
            putNumber[1] = 0
            searchCanPut2(flag : 1)
        }
        
    }
    @IBAction func summon6(){
        if play2Hold[1] != 0 && turn == false{
            protHandClear()
            handButtns6.backgroundColor = UIColor.blue
            putNumber[0] = play2Hold[1]
            putNumber[1] = 1
            searchCanPut2(flag : 1)
        }
    }
    @IBAction func summon7(){
        if play2Hold[2] != 0 && turn == false{
            protHandClear()
            handButtns7.backgroundColor = UIColor.blue
            putNumber[0] = play2Hold[2]
            putNumber[1] = 2
            searchCanPut2(flag : 1)
        }
    }
    @IBAction func summon8(){
        if play2Hold[3] != 0 && turn == false{
            protHandClear()
            handButtns8.backgroundColor = UIColor.blue
            putNumber[0] = play2Hold[3]
            putNumber[1] = 3
            searchCanPut2(flag : 0)
        }
    }
    
    func protHandClear(){
        handButtns1.backgroundColor = UIColor.white
        handButtns2.backgroundColor = UIColor.white
        handButtns3.backgroundColor = UIColor.white
        handButtns4.backgroundColor = UIColor.white
        handButtns5.backgroundColor = UIColor.white
        handButtns6.backgroundColor = UIColor.white
        handButtns7.backgroundColor = UIColor.white
        handButtns8.backgroundColor = UIColor.white
    }
    func allClear(){
        buttns1.backgroundColor = UIColor.brown
        buttns2.backgroundColor = UIColor.brown
        buttns3.backgroundColor = UIColor.brown
        buttns4.backgroundColor = UIColor.brown
        buttns5.backgroundColor = UIColor.brown
        buttns6.backgroundColor = UIColor.brown
        buttns7.backgroundColor = UIColor.brown
        buttns8.backgroundColor = UIColor.brown
        buttns9.backgroundColor = UIColor.brown
        buttns10.backgroundColor = UIColor.brown
        buttns11.backgroundColor = UIColor.brown
        buttns12.backgroundColor = UIColor.brown
        buttns13.backgroundColor = UIColor.brown
        buttns14.backgroundColor = UIColor.brown
        buttns15.backgroundColor = UIColor.brown
        buttns16.backgroundColor = UIColor.brown
        buttns17.backgroundColor = UIColor.brown
        buttns18.backgroundColor = UIColor.brown
        buttns19.backgroundColor = UIColor.brown
        buttns20.backgroundColor = UIColor.brown
        buttns21.backgroundColor = UIColor.brown
        buttns22.backgroundColor = UIColor.brown
        buttns23.backgroundColor = UIColor.brown
        buttns24.backgroundColor = UIColor.brown
        
    }
    func protAlpha(){
        buttns1.alpha = 0.7
        buttns2.alpha = 0.7
        buttns3.alpha = 0.7
        buttns4.alpha = 0.7
        buttns5.alpha = 0.7
        buttns6.alpha = 0.7
        buttns7.alpha = 0.7
        buttns8.alpha = 0.7
        buttns9.alpha = 0.7
        buttns10.alpha = 0.7
        buttns11.alpha = 0.7
        buttns12.alpha = 0.7
        buttns13.alpha = 0.7
        buttns14.alpha = 0.7
        buttns15.alpha = 0.7
        buttns16.alpha = 0.7
        buttns17.alpha = 0.7
        buttns18.alpha = 0.7
        buttns19.alpha = 0.7
        buttns20.alpha = 0.7
        buttns21.alpha = 0.7
        buttns22.alpha = 0.7
        buttns23.alpha = 0.7
        buttns24.alpha = 0.7
        handButtns1.alpha = 0.7
        handButtns2.alpha = 0.7
        handButtns3.alpha = 0.7
        handButtns4.alpha = 0.7
        handButtns5.alpha = 0.7
        handButtns6.alpha = 0.7
        handButtns7.alpha = 0.7
        handButtns8.alpha = 0.7
    }
    @IBAction func start(){
        
        var soundIdRing:SystemSoundID = 0
        if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "open", ofType:"mp3")!) as NSURL?{
            AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
            AudioServicesPlaySystemSound(soundIdRing)
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.tobira1.frame = CGRect(x: self.tobira1.frame.origin.x, y: self.tobira1.center.y + 600, width: self.tobira1.bounds.width, height: self.tobira1.bounds.width)
                self.startButtns.alpha = 0
            
            self.tobira2.frame = CGRect(x: self.tobira2.frame.origin.x, y: self.tobira2.center.y - 600, width: self.tobira2.bounds.width, height: self.tobira2.bounds.width)
            self.startButtns.alpha = 0
        })

                
    }
    @IBAction func blueWin(){
        var soundIdRing:SystemSoundID = 0
        if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "ga-n", ofType:"mp3")!) as NSURL?{
            AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
            AudioServicesPlaySystemSound(soundIdRing)
        }
        finishFlag="red"
        self.performSegue(withIdentifier: "finish", sender: nil)
    }
    @IBAction func redWin(){
        var soundIdRing:SystemSoundID = 0
        if let soundUrl:NSURL = NSURL.fileURL(withPath: Bundle.main.path(forResource: "ga-n", ofType:"mp3")!) as NSURL?{
            AudioServicesCreateSystemSoundID(soundUrl, &soundIdRing)
            AudioServicesPlaySystemSound(soundIdRing)
        }
        finishFlag="blue"
        self.performSegue(withIdentifier: "finish", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finish" {
            let finishViewController = segue.destination as! FinishViewController
            finishViewController.finishFlag = finishFlag
        }
    }
    
}
