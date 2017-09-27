//
//  ButtleOnlineViewController.swift
//  SyoGi_HERO
//
//  Created by Souhei okui on 2017/09/01.
//  Copyright © 2017年 nttr. All rights reserved.
//

import UIKit

class ButtleOnlineViewController: UIViewController {
    var boardMatrix:[[Int]] = [[0,2,0],[0,0,0],[1,1,1],[0,0,0],[0,0,0],[-1,-1,-1],[0,0,0],[0,-2,0]]
    var possibleMatrix:[[Int]] = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
    var possiblePutMatrix:[[Int]] = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
    var lastCallX : Int = -1
    var lastCallY : Int = -1
    var play1Hold : [Int] = [0,0,0,0,0]
    var play2Hold : [Int] = [0,0,0,0,0]
    var putNumber : [Int] = [0,0]
    
        
    var komaImageIndex:[String] = ["hu.png","king.png","gold.png","silva.png","hose.png","kyo.png","to.png","tama.png"]
    var r_komaImageIndex:[String] = ["r_hu.png","r_king.png","r_gold.png","r_silva.png","r_hose.png","kyo.png","to.png","r_tama.png"]
    
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
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func tap(cell_No : Int){
        print("cell : "+String(cell_No))
        var koma_No = boardMatrix[(cell_No-1) / 3][(cell_No-1) % 3]
        print("koma : "+String(koma_No))
        
        print(possibleMatrix)
        print((cell_No-1) / 3)
        print((cell_No-1) % 3)
        print()
        print(lastCallX)
        print(lastCallY)
        
        
        
        if possibleMatrix[(cell_No-1) / 3][(cell_No-1) % 3] == 1{//赤いセルを押した時
            if boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3] < 0{
                handAdd(handNumber : boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3])
            }
            boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3] = boardMatrix[lastCallX][lastCallY]
            boardMatrix[lastCallX][lastCallY]=0
            
            evolve()
            print(play1Hold)
        }
        
        if possiblePutMatrix[(cell_No-1) / 3][(cell_No-1) % 3] == 1{//putの赤いセルを押した時
            boardMatrix [(cell_No-1) / 3][(cell_No-1) % 3] = putNumber[0]
            play1Hold[putNumber[1]] = 0
        }
        
        possibleMatrix = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
        possiblePutMatrix = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]
        lastCallX = -1
        lastCallY = -1
        
        if koma_No == 1 {
            print("歩だよ")
            callHu(cell_No:cell_No)
        }
        if koma_No == 2 {
            print("キングだよ")
            callKing(cell_No:cell_No)
        }
        if koma_No == 3 || koma_No == 7{
            print("金だよ")
            callGold(cell_No:cell_No)
        }
        if koma_No == 4 {
            print("銀だよ")
            callSilva(cell_No:cell_No)
        }
        if koma_No == 5 {
            print("馬だよ")
            callHose(cell_No:cell_No)
        }
        print(possibleMatrix)
        plotPossible()
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
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
            
        }
        else if  4 < cell_No && cell_No < 22 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No-4)/3][1] <= 0 {possibleMatrix [(cell_No-4)/3][1] = 1}
            if  boardMatrix[(cell_No-4)/3][2] <= 0 {possibleMatrix [(cell_No-4)/3][2] = 1}
            if  boardMatrix[(cell_No-1)/3][1] <= 0 {possibleMatrix [(cell_No-1)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][1] <= 0 {possibleMatrix [(cell_No+2)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][2] <= 0 {possibleMatrix [(cell_No+2)/3][2] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
            
        }
        else if  3 < cell_No && cell_No < 22 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No-2)/3][0] <= 0 {possibleMatrix [(cell_No-2)/3][0] = 1}
            if  boardMatrix[(cell_No-2)/3][1] <= 0 {possibleMatrix [(cell_No-2)/3][1] = 1}
            if  boardMatrix[(cell_No)/3][1] <= 0 {possibleMatrix [(cell_No)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][0] <= 0 {possibleMatrix [(cell_No+2)/3][0] = 1}
            if  boardMatrix[(cell_No+2)/3][1] <= 0 {possibleMatrix [(cell_No+2)/3][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
            
        }
        else if cell_No == 2 {
            print("初期値")
            if  boardMatrix[0][0] <= 0 { possibleMatrix [0][0] = 1}
            if  boardMatrix[0][2] <= 0 { possibleMatrix [0][2] = 1}
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        else if cell_No == 23 {
            if  boardMatrix[7][0] <= 0 { possibleMatrix [7][0] = 1}
            if  boardMatrix[7][2] <= 0 { possibleMatrix [7][2] = 1}
            if  boardMatrix[6][0] <= 0 { possibleMatrix [6][0] = 1}
            if  boardMatrix[6][1] <= 0 { possibleMatrix [6][1] = 1}
            if  boardMatrix[6][2] <= 0 { possibleMatrix [6][2] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        else if cell_No == 1 {//王のかど
            if  boardMatrix[0][1] <= 0 { possibleMatrix [0][1] = 1}
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        else if cell_No == 3 {//王のかど
            if  boardMatrix[0][1] <= 0 { possibleMatrix [0][1] = 1}
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        else if cell_No == 22 {//王のかど
            if  boardMatrix[6][1] <= 0 { possibleMatrix [6][1] = 1}
            if  boardMatrix[6][0] <= 0 { possibleMatrix [6][0] = 1}
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        else if cell_No == 24 {//王のかど
            if  boardMatrix[6][1] <= 0 { possibleMatrix [6][1] = 1}
            if  boardMatrix[6][2] <= 0 { possibleMatrix [6][2] = 1}
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        
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
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
            
        }
        else if  4 < cell_No && cell_No < 22 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No-4)/3][2] <= 0 {possibleMatrix [(cell_No-4)/3][2] = 1}
            if  boardMatrix[(cell_No-1)/3][1] <= 0 {possibleMatrix [(cell_No-1)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][1] <= 0 {possibleMatrix [(cell_No+2)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][2] <= 0 {possibleMatrix [(cell_No+2)/3][2] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
            
        }
        else if  3 < cell_No && cell_No < 22 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No-2)/3][0] <= 0 {possibleMatrix [(cell_No-2)/3][0] = 1}
            if  boardMatrix[(cell_No)/3][1] <= 0 {possibleMatrix [(cell_No)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][0] <= 0 {possibleMatrix [(cell_No+2)/3][0] = 1}
            if  boardMatrix[(cell_No+2)/3][1] <= 0 {possibleMatrix [(cell_No+2)/3][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
            
        }
        else if cell_No == 2 {
            print("初期値")
            if  boardMatrix[0][0] <= 0 { possibleMatrix [0][0] = 1}
            if  boardMatrix[0][2] <= 0 { possibleMatrix [0][2] = 1}
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        else if cell_No == 23 {
            if  boardMatrix[7][0] <= 0 { possibleMatrix [7][0] = 1}
            if  boardMatrix[7][2] <= 0 { possibleMatrix [7][2] = 1}
            if  boardMatrix[6][1] <= 0 { possibleMatrix [6][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        else if cell_No == 1 {//金のかど
            if  boardMatrix[0][1] <= 0 { possibleMatrix [0][1] = 1}
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        else if cell_No == 3 {//金のかど
            if  boardMatrix[0][1] <= 0 { possibleMatrix [0][1] = 1}
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        else if cell_No == 22 {//金のかど
            if  boardMatrix[6][0] <= 0 { possibleMatrix [6][0] = 1}
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        else if cell_No == 24 {//金のかど
            if  boardMatrix[6][2] <= 0 { possibleMatrix [6][2] = 1}
            if  boardMatrix[7][1] <= 0 { possibleMatrix [7][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
    }
    func callSilva(cell_No : Int){
        if  4 < cell_No && cell_No < 22 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[(cell_No-3)/3][0] <= 0 {possibleMatrix [(cell_No-3)/3][0] = 1}
            if  boardMatrix[(cell_No+3)/3][1] <= 0 {possibleMatrix [(cell_No+3)/3][1] = 1}
            if  boardMatrix[(cell_No-3)/3][2] <= 0 {possibleMatrix [(cell_No-3)/3][2] = 1}
            if  boardMatrix[(cell_No+3)/3][0] <= 0 {possibleMatrix [(cell_No+3)/3][0] = 1}
            if  boardMatrix[(cell_No+3)/3][2] <= 0 {possibleMatrix [(cell_No+3)/3][2] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
            
        }
        else if  4 < cell_No && cell_No < 22 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No-4)/3][1] <= 0 {possibleMatrix [(cell_No-4)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][2] <= 0 {possibleMatrix [(cell_No+2)/3][2] = 1}
            if  boardMatrix[(cell_No+2)/3][1] <= 0 {possibleMatrix [(cell_No+2)/3][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
            
        }
        else if  3 < cell_No && cell_No < 22 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No+2)/3][0] <= 0 {possibleMatrix [(cell_No+2)/3][0] = 1}
            if  boardMatrix[(cell_No-2)/3][1] <= 0 {possibleMatrix [(cell_No-2)/3][1] = 1}
            if  boardMatrix[(cell_No+2)/3][1] <= 0 {possibleMatrix [(cell_No+2)/3][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
            
        }
        else if cell_No == 2 {
            print("初期値")
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        else if cell_No == 23 {
            if  boardMatrix[6][0] <= 0 { possibleMatrix [6][0] = 1}
            if  boardMatrix[6][2] <= 0 { possibleMatrix [6][2] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        else if cell_No == 1 {//銀のかど
            if  boardMatrix[1][0] <= 0 { possibleMatrix [1][0] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        else if cell_No == 3 {//銀のかど
            if  boardMatrix[1][2] <= 0 { possibleMatrix [1][2] = 1}
            if  boardMatrix[1][1] <= 0 { possibleMatrix [1][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        else if cell_No == 22 {//銀のかど
            if  boardMatrix[6][1] <= 0 { possibleMatrix [6][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        else if cell_No == 24 {//銀のかど
            if  boardMatrix[6][1] <= 0 { possibleMatrix [6][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
        }
        
    }
    
    
    func callHose(cell_No : Int){
        if  0 < cell_No && cell_No < 18 && cell_No % 3 == 2 {
            print("中央")
            if  boardMatrix[(cell_No+5)/3][0] <= 0 {possibleMatrix [(cell_No+5)/3][0] = 1}
            if  boardMatrix[(cell_No+5)/3][2] <= 0 {possibleMatrix [(cell_No+5)/3][2] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
            
        }
        else if  0 < cell_No && cell_No < 19 && cell_No % 3 == 0 {
            print("右サイド")
            if  boardMatrix[(cell_No+5)/3][1] <= 0 {possibleMatrix [(cell_No+5)/3][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
            
        }
        else if  0 <= cell_No && cell_No < 18 && cell_No % 3 == 1 {
            print("左サイド")
            if  boardMatrix[(cell_No+5)/3][1] <= 0 {possibleMatrix [(cell_No+5)/3][1] = 1}
            lastCallX = ((cell_No-1) / 3)
            lastCallY = (cell_No-1) % 3
            
        }
    }
    
    func handAdd(handNumber : Int){
        for x in 0...2{
            if play1Hold[x] == 0 && handNumber < -1{
                play1Hold[x] = handNumber * -1
                break
            }
        }
        if handNumber == -1{
            play1Hold[3] = 1
            play1Hold[4] = play1Hold[4] + 1
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
    
    func evolve(){
        for x in 5...7{
            for y in 0...2{
                if boardMatrix[x][y] == 1 {boardMatrix[x][y] = 7}
                if 4 <= boardMatrix[x][y] && boardMatrix[x][y] <= 6 {boardMatrix[x][y] = 3}
            }
        }
    }
    
    func plotKoma(){//駒の画像をプロット
        for x in 0...7{//駒が追加されたらこのfar文も長くする
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
        for x in -8 ... -1{//駒が追加されたらこのfar文も長くする
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
        for x in 1...8{//駒が追加されたらこのfar文も長くする
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
        if play1Hold[4] != 0{
            holdingHu1.text = String(play1Hold[4])
        }
    }
    func plotHandKoma2(){//駒の画像をプロット
        for x in 1...8{//駒が追加されたらこのfar文も長くする
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
        if play2Hold[4] != 0{
            holdingHu2.text = String(play2Hold[4])
        }
    }
    
    func searchCanPut(flag : Int){
        for x in 0...7{
            for y in 0...2{
                if boardMatrix[x][y] == 0{
                    possiblePutMatrix[x][y] = 1
                }
            }
        }
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
        if play1Hold[0] != 0{
            handButtns1.backgroundColor = UIColor.red
            putNumber[0] = play1Hold[0]
            putNumber[1] = 0
            searchCanPut(flag : 1)
        }
        
    }
    @IBAction func summon2(){
        if play1Hold[1] != 0{
            handButtns2.backgroundColor = UIColor.red
            putNumber[0] = play1Hold[1]
            putNumber[1] = 1
            searchCanPut(flag : 1)
        }
    }
    @IBAction func summon3(){
        if play1Hold[2] != 0{
            handButtns3.backgroundColor = UIColor.red
            putNumber[0] = play1Hold[2]
            putNumber[1] = 2
            searchCanPut(flag : 1)
        }
    }
    @IBAction func summon4(){
        if play1Hold[3] != 0{
            handButtns4.backgroundColor = UIColor.red
            putNumber[0] = play1Hold[3]
            putNumber[1] = 3
            searchCanPut(flag : 0)
        }
    }
    
    
    
    
    
}
