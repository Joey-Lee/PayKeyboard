//
//  ViewController.swift
//  Example
//
//  Created by Joey Lee on 12/4/17.
//  Copyright © 2017 Joey, Inc. All rights reserved.
//

import UIKit
import PayKeyboard

class ViewController: UIViewController, PayDelegate {
    func wechatPay(_ calculator: PayKeyboard, didChangeValue value: String) {
        print("微信支付按钮按下，支付金额为：\(value)")
    }
    
    func aliPay(_ calculator: PayKeyboard, didChangeValue value: String) {
        print("支付宝支付按钮按下，支付金额为：\(value)")
    }

    
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
        let keyboard = PayKeyboard(frame: frame)
        keyboard.delegate = self
        keyboard.showDecimal = true
        inputTextField.inputView = keyboard
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        inputTextField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - PayKeyboard delegate
    func calculator(_ calculator: PayKeyboard, didChangeValue value: String) {
        inputTextField.text = value
    }
}

