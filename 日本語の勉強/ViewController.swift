//
//  ViewController.swift
//  日本語の勉強
//
//  Created by suncihai on 16/1/22.
//  Copyright © 2016年 suncihai. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var Letter1:UIImageView!
    @IBOutlet weak var Letter2:UIImageView!
    @IBOutlet weak var Letter3:UIImageView!
    @IBOutlet weak var Letter4:UIImageView!
    @IBOutlet weak var Letter5:UIImageView!
    @IBOutlet weak var Letter6:UIImageView!
    @IBOutlet weak var Letter7:UIImageView!
    @IBOutlet weak var Letter8:UIImageView!
    @IBOutlet weak var Letter9:UIImageView!
    @IBOutlet weak var Check1:UIImageView!
    @IBOutlet weak var Check2:UIImageView!
    @IBOutlet weak var Check3:UIImageView!
    @IBOutlet weak var Check4:UIImageView!
    @IBOutlet weak var Check5:UIImageView!
    @IBOutlet weak var Check6:UIImageView!
    @IBOutlet weak var Check7:UIImageView!
    @IBOutlet weak var Check8:UIImageView!
    @IBOutlet weak var Check9:UIImageView!
    
    @IBOutlet weak var Hidden:UIImageView!
    @IBOutlet weak var dialogue:UIImageView!
    
    @IBOutlet weak var Result:UILabel!
    @IBOutlet weak var Next:UIButton!
    @IBOutlet weak var Music:UIButton!
    @IBOutlet weak var StopMusic:UIButton!
    
    @IBOutlet weak var Sakura:UIWebView!

    var backgroundMusic:AVAudioPlayer?


    var LetterArray:[String]=["a","i","u","e","o","ka","ki","ku","ke","ko","sa","shi","su","se","so","ta","chi","tsu","te","to","na","ni","nu","ne","no","ha","hi","fu","he","ho","ma","mi","mu","me","mo","ra","ri","ru","re","ro","ya","yu","yo","wa","wo","n"]
    var LetterImageArray:[String]=["a.png","i.png","u.png","e.png","o.png","ka.png","ki.png","ku.png","ke.png","ko.png","sa.png","shi.png","su.png","se.png","so.png","ta.png","chi.png","tsu.png","te.png","to.png","na.png","ni.png","nu.png","ne.png","no.png","ha.png","hi.png","fu.png","he.png","ho.png","ma.png","mi.png","mu.png","me.png","mo.png","ra.png","ri.png","ru.png","re.png","ro.png","ya.png","yu.png","yo.png","wa.png","wo.png","n.png"]


    var LetterRandomNumber:[Int]=[0,0,0,0,0,0,0,0,0,0]
    var TransferNumber = 100
    var HiddenShown=false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor=UIColor(patternImage: UIImage(named: "background.jpg")!)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        let upSwipe=UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector("handleLongPress:"))
        let tap=UITapGestureRecognizer(target: self, action: Selector("handleTapGesture:"))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        upSwipe.direction = .Up
        
        longPress.minimumPressDuration=1.5
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(upSwipe)
        
        view.addGestureRecognizer(longPress)
        view.addGestureRecognizer(tap)
        
        Sakura.backgroundColor=UIColor.clearColor()
        Sakura.opaque=false
        
        Sakura.tag=100
        
        Hidden.userInteractionEnabled=true
        
        let tapHidden=UITapGestureRecognizer(target: self, action: Selector("tapHiddenHandler:"))
        
        Hidden.addGestureRecognizer(tapHidden)
        
    }
    
    func tapHiddenHandler(sender:UITapGestureRecognizer){
        if(HiddenShown==true){
             let dialoguepick=Int(arc4random_uniform(8))
            if(dialoguepick==0){
                self.dialogue.image=UIImage(named: "dialogue1.png")
            }
            if(dialoguepick==1){
                self.dialogue.image=UIImage(named: "dialogue2.png")
            }
            if(dialoguepick==2){
                self.dialogue.image=UIImage(named: "dialogue3.png")
            }
            if(dialoguepick==3){
                self.dialogue.image=UIImage(named: "dialogue5.png")
            }
            if(dialoguepick==4){
                self.dialogue.image=UIImage(named: "dialogue6.png")
            }
            if(dialoguepick==5){
                self.dialogue.image=UIImage(named: "dialogue7.png")
            }
            if(dialoguepick==6){
                self.dialogue.image=UIImage(named: "dialogue8.png")
            }
            if(dialoguepick==7){
                self.dialogue.image=UIImage(named: "dialogue9.png")
            }
        }
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer){
        if (sender.direction == .Left){
            print("Swipe Left")
            self.view.backgroundColor=UIColor(patternImage: UIImage(named: "conanbackground.jpg")!)
        }
        if (sender.direction == .Right){
            print("Swipe Right")
            self.view.backgroundColor=UIColor(patternImage: UIImage(named: "hunterbackground.jpg")!)
        }
        if (sender.direction == .Up){
            print("Swipe Up")
            self.view.backgroundColor=UIColor(patternImage: UIImage(named: "background.jpg")!)
        }
    }
    
    func handleLongPress(sender:UILongPressGestureRecognizer){
            if (sender.state == UIGestureRecognizerState.Began){
                HiddenShown=true
                self.Hidden.image=UIImage(named: "conan.png")
            }
    }
    
    func handleTapGesture(sender:UITapGestureRecognizer){
        if(TransferNumber==0){
            self.Check1.image=UIImage(named: "tick.png")
        }
        if(TransferNumber==1){
            self.Check2.image=UIImage(named: "tick.png")
        }
        if(TransferNumber==2){
            self.Check3.image=UIImage(named: "tick.png")
        }
        if(TransferNumber==3){
            self.Check4.image=UIImage(named: "tick.png")
        }
        if(TransferNumber==4){
            self.Check5.image=UIImage(named: "tick.png")
        }
        if(TransferNumber==5){
            self.Check6.image=UIImage(named: "tick.png")
        }
        if(TransferNumber==6){
            self.Check7.image=UIImage(named: "tick.png")
        }
        if(TransferNumber==7){
            self.Check8.image=UIImage(named: "tick.png")
        }
        if(TransferNumber==8){
            self.Check9.image=UIImage(named: "tick.png")
        }
        TransferNumber=100
    }
    
    @IBAction func GetNewLetter(sender:UIButton) {
        LetterRandomNumber[0]=Int(arc4random_uniform(46))
        
        repeat{LetterRandomNumber[1]=Int(arc4random_uniform(46))}while(LetterRandomNumber[1]==LetterRandomNumber[0])
 
        repeat{LetterRandomNumber[2]=Int(arc4random_uniform(46))}while(LetterRandomNumber[2]==LetterRandomNumber[1]||LetterRandomNumber[2]==LetterRandomNumber[0])
        
        repeat{LetterRandomNumber[3]=Int(arc4random_uniform(46))}while(LetterRandomNumber[3]==LetterRandomNumber[2]||LetterRandomNumber[3]==LetterRandomNumber[1]||LetterRandomNumber[3]==LetterRandomNumber[0])
        
        repeat{LetterRandomNumber[4]=Int(arc4random_uniform(46))}while(LetterRandomNumber[4]==LetterRandomNumber[3]||LetterRandomNumber[4]==LetterRandomNumber[2]||LetterRandomNumber[4]==LetterRandomNumber[1]||LetterRandomNumber[4]==LetterRandomNumber[0])
        
        repeat{LetterRandomNumber[5]=Int(arc4random_uniform(46))}while(LetterRandomNumber[5]==LetterRandomNumber[4]||LetterRandomNumber[5]==LetterRandomNumber[3]||LetterRandomNumber[5]==LetterRandomNumber[2]||LetterRandomNumber[5]==LetterRandomNumber[1]||LetterRandomNumber[5]==LetterRandomNumber[0])
        
        repeat{LetterRandomNumber[6]=Int(arc4random_uniform(46))}while(LetterRandomNumber[6]==LetterRandomNumber[5]||LetterRandomNumber[6]==LetterRandomNumber[4]||LetterRandomNumber[6]==LetterRandomNumber[3]||LetterRandomNumber[6]==LetterRandomNumber[2]||LetterRandomNumber[6]==LetterRandomNumber[1]||LetterRandomNumber[6]==LetterRandomNumber[0])
        
        repeat{LetterRandomNumber[7]=Int(arc4random_uniform(46))}while(LetterRandomNumber[7]==LetterRandomNumber[6]||LetterRandomNumber[7]==LetterRandomNumber[5]||LetterRandomNumber[7]==LetterRandomNumber[4]||LetterRandomNumber[7]==LetterRandomNumber[3]||LetterRandomNumber[7]==LetterRandomNumber[2]||LetterRandomNumber[7]==LetterRandomNumber[1]||LetterRandomNumber[7]==LetterRandomNumber[0])
        
        repeat{LetterRandomNumber[8]=Int(arc4random_uniform(46))}while(LetterRandomNumber[8]==LetterRandomNumber[7]||LetterRandomNumber[8]==LetterRandomNumber[6]||LetterRandomNumber[8]==LetterRandomNumber[5]||LetterRandomNumber[8]==LetterRandomNumber[4]||LetterRandomNumber[8]==LetterRandomNumber[3]||LetterRandomNumber[8]==LetterRandomNumber[2]||LetterRandomNumber[8]==LetterRandomNumber[1]||LetterRandomNumber[8]==LetterRandomNumber[0])
        
        repeat{LetterRandomNumber[9]=Int(arc4random_uniform(46))}while(LetterRandomNumber[9]==LetterRandomNumber[8]||LetterRandomNumber[9]==LetterRandomNumber[7]||LetterRandomNumber[9]==LetterRandomNumber[6]||LetterRandomNumber[9]==LetterRandomNumber[5]||LetterRandomNumber[9]==LetterRandomNumber[4]||LetterRandomNumber[9]==LetterRandomNumber[3]||LetterRandomNumber[9]==LetterRandomNumber[2]||LetterRandomNumber[9]==LetterRandomNumber[1]||LetterRandomNumber[9]==LetterRandomNumber[0])
        
        let LetterString1:String=self.LetterImageArray[LetterRandomNumber[0]]
        let LetterString2:String=self.LetterImageArray[LetterRandomNumber[1]]
        let LetterString3:String=self.LetterImageArray[LetterRandomNumber[2]]
        let LetterString4:String=self.LetterImageArray[LetterRandomNumber[3]]
        let LetterString5:String=self.LetterImageArray[LetterRandomNumber[4]]
        let LetterString6:String=self.LetterImageArray[LetterRandomNumber[5]]
        let LetterString7:String=self.LetterImageArray[LetterRandomNumber[6]]
        let LetterString8:String=self.LetterImageArray[LetterRandomNumber[7]]
        let LetterString9:String=self.LetterImageArray[LetterRandomNumber[8]]
        
        let LetterStringAnswer:String=self.LetterImageArray[LetterRandomNumber[9]]
        
        self.Letter1.image=UIImage(named: LetterString1)
        self.Letter2.image=UIImage(named: LetterString2)
        self.Letter3.image=UIImage(named: LetterString3)
        self.Letter4.image=UIImage(named: LetterString4)
        self.Letter5.image=UIImage(named: LetterString5)
        self.Letter6.image=UIImage(named: LetterString6)
        self.Letter7.image=UIImage(named: LetterString7)
        self.Letter8.image=UIImage(named: LetterString8)
        self.Letter9.image=UIImage(named: LetterString9)
        
        let AnswerNumber=Int(arc4random_uniform(9))
        TransferNumber=AnswerNumber
        
        self.Result.text=LetterArray[LetterRandomNumber[9]]
        
        if(AnswerNumber==0){
           self.Letter1.image=UIImage(named: LetterStringAnswer)
        }
        if(AnswerNumber==1){
           self.Letter2.image=UIImage(named: LetterStringAnswer)
        }
        if(AnswerNumber==2){
        self.Letter3.image=UIImage(named: LetterStringAnswer)
        }
        if(AnswerNumber==3){
            self.Letter4.image=UIImage(named: LetterStringAnswer)
        }
        if(AnswerNumber==4){
            self.Letter5.image=UIImage(named: LetterStringAnswer)
        }
        if(AnswerNumber==5){
            self.Letter6.image=UIImage(named: LetterStringAnswer)
        }
        if(AnswerNumber==6){
            self.Letter7.image=UIImage(named: LetterStringAnswer)
        }
        if(AnswerNumber==7){
            self.Letter8.image=UIImage(named: LetterStringAnswer)
        }
        if(AnswerNumber==8){
            self.Letter9.image=UIImage(named: LetterStringAnswer)
        }
        
        self.Check1.image=UIImage(named: "")
        self.Check2.image=UIImage(named: "")
        self.Check3.image=UIImage(named: "")
        self.Check4.image=UIImage(named: "")
        self.Check5.image=UIImage(named: "")
        self.Check6.image=UIImage(named: "")
        self.Check7.image=UIImage(named: "")
        self.Check8.image=UIImage(named: "")
        self.Check9.image=UIImage(named: "")

    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake{
            let filePath = NSBundle.mainBundle().pathForResource("sakuraroll3", ofType: "gif")
            let gif = NSData(contentsOfFile: filePath!)
            
            
            Sakura.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
            Sakura.userInteractionEnabled=false
            self.view.addSubview(Sakura)
        }
    }
    
    func setupAudioPlayerWithFile(file:NSString,type:NSString)->AVAudioPlayer?{
        let path=NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url=NSURL.fileURLWithPath(path!)
        
        var audioPlayer:AVAudioPlayer?
        
        do{
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        }catch {
            
        }
        
        return audioPlayer
    }
    
    @IBAction func PlayMusic(){
        let musicpicker=Int(arc4random_uniform(4))
        if(musicpicker==0){
            if let backgroundMusic = self.setupAudioPlayerWithFile("sakura", type: "mp3"){
                self.backgroundMusic = backgroundMusic
            }
        }
        if(musicpicker==1){
            if let backgroundMusic = self.setupAudioPlayerWithFile("smallsong", type: "mp3"){
                self.backgroundMusic = backgroundMusic
            }
        }
        if(musicpicker==2){
            if let backgroundMusic = self.setupAudioPlayerWithFile("sakuranbo", type: "mp3"){
                self.backgroundMusic = backgroundMusic
            }
        }
        if(musicpicker==3){
            if let backgroundMusic = self.setupAudioPlayerWithFile("icho", type: "mp3"){
                self.backgroundMusic = backgroundMusic
            }
        }
        backgroundMusic?.play()
        
    }
    
    @IBAction func Stop(){
        backgroundMusic?.stop()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

