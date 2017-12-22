//
//  ViewController.swift
//  nAnB
//
//  Created by 黃健偉 on 2017/12/17.
//  Copyright © 2017年 黃健偉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var charNumberArray: [Character] = ["0","1","2","3","4","5","6","7","8","9"]
    var nA: Int = 0
    var nB: Int = 0
    var playCount:Int = 0

    @IBOutlet var inputBar: UILabel!
    @IBOutlet var outputBar: UILabel!
    
    @IBAction func key_0(_ sender: Any) {
        if !(inputBar.text?.count == 4) {
            inputBar.text! += "0"
        }
    }
    
    @IBAction func key_1(_ sender: Any) {
        if !(inputBar.text?.count == 4) {
            inputBar.text! += "1"
        }
    }
    
    @IBAction func key_2(_ sender: Any) {
        if !(inputBar.text?.count == 4) {
            inputBar.text! += "2"
        }
    }
    
    @IBAction func key_3(_ sender: Any) {
        if !(inputBar.text?.count == 4) {
            inputBar.text! += "3"
        }
    }
    
    @IBAction func key_4(_ sender: Any) {
        if !(inputBar.text?.count == 4) {
            inputBar.text! += "4"
        }
    }
    
    @IBAction func key_5(_ sender: Any) {
        if !(inputBar.text?.count == 4) {
            inputBar.text! += "5"
        }
    }
    
    @IBAction func key_6(_ sender: Any) {
        if !(inputBar.text?.count == 4) {
            inputBar.text! += "6"
        }
    }
    
    @IBAction func key_7(_ sender: Any) {
        if !(inputBar.text?.count == 4) {
            inputBar.text! += "7"
        }
    }
    
    @IBAction func key_8(_ sender: Any) {
        if !(inputBar.text?.count == 4) {
            inputBar.text! += "8"
        }
    }
    
    @IBAction func key_9(_ sender: Any) {
        if !(inputBar.text?.count == 4) {
            inputBar.text! += "9"
        }
    }
    
    @IBAction func back(_ sender: Any) {
        if !(inputBar.text! == "") {
            inputBar.text!.removeLast(1)
        }
    }
    
    @IBOutlet weak var enterBtn: UIButton!
    @IBAction func enter(_ sender: Any) {
        if (inputBar.text?.count == 4) {
            playCount += 1
            let splitedCharArr:[Character] = Array(inputBar.text!.characters)
            //case 4A0B
            if (splitedCharArr[0] == charNumberArray[0] && splitedCharArr[1] == charNumberArray[1] && splitedCharArr[2] == charNumberArray[2] && splitedCharArr[3] == charNumberArray[3]) {
                nA = 4
                nB = 0
            } else {
                //check number 0
                if (splitedCharArr[0] == charNumberArray[0]) {
                    nA += 1
                } else if (splitedCharArr[0] == charNumberArray[1]) {
                    nB += 1
                } else if (splitedCharArr[0] == charNumberArray[2]) {
                    nB += 1
                } else if (splitedCharArr[0] == charNumberArray[3]) {
                    nB += 1
                }

                //check number 1
                if (splitedCharArr[1] == charNumberArray[1]) {
                    nA += 1
                } else if (splitedCharArr[1] == charNumberArray[0]) {
                    nB += 1
                } else if (splitedCharArr[1] == charNumberArray[2]) {
                    nB += 1
                } else if (splitedCharArr[1] == charNumberArray[3]) {
                    nB += 1
                }

                //check number 2
                if (splitedCharArr[2] == charNumberArray[2]) {
                    nA += 1
                } else if (splitedCharArr[2] == charNumberArray[0]) {
                    nB += 1
                } else if (splitedCharArr[2] == charNumberArray[1]) {
                    nB += 1
                } else if (splitedCharArr[2] == charNumberArray[3]) {
                    nB += 1
                }

                //check number 3
                if (splitedCharArr[3] == charNumberArray[3]) {
                    nA += 1
                } else if (splitedCharArr[3] == charNumberArray[0]) {
                    nB += 1
                } else if (splitedCharArr[3] == charNumberArray[1]) {
                    nB += 1
                } else if (splitedCharArr[3] == charNumberArray[2]) {
                    nB += 1
                }
            }
            outputBar.text! += "第\(playCount)次，輸入\(inputBar.text!):\(nA)A\(nB)B\n"
            inputBar.text! = ""
            if (nA == 4) {
                outputBar.text! += "You Are Winner!!\n"
                self.enterBtn.isEnabled = false
            } else if (playCount == 10) {
                outputBar.text! += "You Are Loser!!\n"
                self.enterBtn.isEnabled = false
            }
            nA = 0
            nB = 0
        }
    }
    @IBAction func rePlay(_ sender: Any) {
        inputBar.text! = ""
        outputBar.text! = ""
        playCount = 0
        nAnB_init()
        self.enterBtn.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputBar.text! = ""
        outputBar.text! = ""
        nAnB_init()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func nAnB_init() {
        var last = charNumberArray.count - 1
        
        while(last > 0)
        {
            let rand = Int(arc4random_uniform(UInt32(last)))
            charNumberArray.swapAt(last, rand)
            last -= 1
        }
        print(charNumberArray[0])
        print(charNumberArray[1])
        print(charNumberArray[2])
        print(charNumberArray[3])
        outputBar.text! += "請輸入4位數之數字\n"
    }

}

