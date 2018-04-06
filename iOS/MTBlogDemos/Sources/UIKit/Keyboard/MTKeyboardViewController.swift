//
//  MTKeyboardViewController.swift
//  MTBlogDemos
//
//  Created by LiMengtian on 2018/4/6.
//  Copyright © 2018 LiMengtian. All rights reserved.
//

import UIKit

class MTKeyboardViewController: UIViewController {
    
    //输入框view 到底部的约束
    @IBOutlet weak var bottomAlignConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //注册键盘相关的通知
        self.registerNotification()
        
        //点击手势 收起键盘
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Notification
    
    
    fileprivate func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidChangeFrame(_:)), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(_ notification : Notification) {
        MTKeyboardViewController.logKeyBoardInfo("keyboardWillShow", userInfo: notification.userInfo)
        
        let duration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        if let endFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let height = endFrame.height
            UIView.animate(withDuration: duration, delay: 0.0, options: [/*.beginFromCurrentState*/], animations: { [weak self] in
                self?.bottomAlignConstraint.constant = height
                self?.view.layoutIfNeeded()
                }, completion: nil)
        }
    }
    
    @objc fileprivate func keyboardDidShow(_ notification : Notification) {
        MTKeyboardViewController.logKeyBoardInfo("keyboardDidShow", userInfo: notification.userInfo)
        
    }
    
    @objc fileprivate func keyboardWillHide(_ notification : Notification) {
        MTKeyboardViewController.logKeyBoardInfo("keyboardWillHide", userInfo: notification.userInfo)
        let duration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        UIView.animate(withDuration: duration, delay: 0.0, options: [/*.beginFromCurrentState*/], animations: { [weak self] in
            self?.bottomAlignConstraint.constant = 0
            self?.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    @objc fileprivate func keyboardDidHide(_ notification : Notification) {
        MTKeyboardViewController.logKeyBoardInfo("keyboardDidHide", userInfo: notification.userInfo)
    }
    
    @objc fileprivate func keyboardWillChangeFrame(_ notification : Notification) {
        MTKeyboardViewController.logKeyBoardInfo("keyboardWillChangeFrame", userInfo: notification.userInfo)
    }
    
    @objc fileprivate func keyboardDidChangeFrame(_ notification: Notification) {
        MTKeyboardViewController.logKeyBoardInfo("keyboardDidChangeFrame", userInfo: notification.userInfo)
    }
    
    //MARK: - Action
    
    @objc fileprivate func handleTap(_ gesture: UITapGestureRecognizer) {
        self.resginFirstRespoinder()
    }
    
    @IBAction func cancelClick(_ sender: Any) {
        self.resginFirstRespoinder()
    }
    
    fileprivate func resginFirstRespoinder() {
        self.view.endEditing(true)
    }
    
    //MARK: - Loger
    
    fileprivate class func logKeyBoardInfo(_ methodName:String, userInfo: [AnyHashable : Any]?) {
        print("--------\(methodName)--------")
        
        if let beginFrame = (userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            print("beiginFrame = \(beginFrame)")
        }
        if  let endFrame = (userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            print("endFrame = \(endFrame)")
        }
        if  let duration = (userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue {
            print("duration = \(duration)")
        }
        if let curveRawValue = (userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber )?.intValue,
            let _ = UIViewAnimationCurve(rawValue: curveRawValue) {
            print("curveRawValue = \(curveRawValue)")
        }
        
        print("--------\(methodName)--------\n")
    }
    
}
