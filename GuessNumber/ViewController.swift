//
//  ViewController.swift
//  GuessNumber
//
//  Created by 林暐潔 on 2016/10/23.
//  Copyright © 2016年 林暐潔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ansNumber: Int = 0 //answer
    var count = 6 //次數
    
    @IBOutlet weak var showMessage: UILabel!
    @IBOutlet weak var mixNumber: UILabel!
    @IBOutlet weak var maxNumber: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var countMessage: UILabel!
    
    func confirm() {
        
        if inputTextField.text != "" {
            let input = Int(inputTextField.text!)!
            let mix = Int(mixNumber.text!)!
            let max = Int(maxNumber.text!)!
            
            if count > 0 {
                if input >= mix && input <= max {
                    count -= 1
                    //                    countMessage.text = "您還有\(count)次機會！！！"
                    if input == ansNumber {
                        showMessage.text = "哇！！正確答案就是『\(ansNumber)』"
                    } else {
                        
                        if input < ansNumber {
                            showMessage.text = "\(input) 太小囉！！"
                            mixNumber.text = "\(input)"
                        } else if input > ansNumber {
                            showMessage.text = "\(input) 太大囉！！"
                            maxNumber.text = "\(input)"
                        }
                        if count == 0 {
                            countMessage.text = "沒有機會了，答案是\(ansNumber)\n請儘速按下Reset鈕"
                            showMessage.text = "沒有機會了，答案是\(ansNumber)"
                        } else {
                            countMessage.text = "您還有\(count)次機會！！！"
                        }
                    }
                } else {
                    showMessage.text = "您輸入的數字不在範圍內。"
                }
            }
            inputTextField.text = ""
        } else {
            showMessage.text = "您還沒輸入數字喔。笨蛋"
        }
    }
    
    func reset() {
        viewDidLoad()
    }
    
    @IBAction func confirmButton(_ sender: AnyObject) {
        confirm()
    }
    @IBAction func resetButton(_ sender: AnyObject) {
        reset()
    }

    
    
    // 按空白處會隱藏編輯狀態
    func hideKeyboard(_ tapG:UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ansNumber = Int(arc4random_uniform(150)) + 1 //隨機出現數字1~150
        countMessage.text = ""
        mixNumber.text = String(1)  //範圍最小數字
        maxNumber.text = String(150)  //範圍最大數字
        inputTextField.text = ""
        count = 6
        showMessage.text = "請輸入範圍內數字。"
        
        
        // 增加一個觸控事件
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.hideKeyboard(_:)))
        tap.cancelsTouchesInView = false
        
        // 加在最基底的 self.view 上
        self.view.addGestureRecognizer(tap)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

