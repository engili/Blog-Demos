//
//  ViewController.swift
//  MTKeyboardNotificationDemo
//
//  Created by LiMengtian on 2018/4/1.
//  Copyright © 2018 LiMengtian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bottomAlignConstraint: NSLayoutConstraint!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.registerNotification()
        
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
        ViewController.logKeyBoardInfo("keyboardWillShow", userInfo: notification.userInfo)
        
        let duration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        if let endFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let height = endFrame.height
            UIView.animate(withDuration: duration, delay: 0.0, options: [.beginFromCurrentState], animations: { [weak self] in
                self?.bottomAlignConstraint.constant = height
                self?.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    @objc fileprivate func keyboardDidShow(_ notification : Notification) {
        ViewController.logKeyBoardInfo("keyboardDidShow", userInfo: notification.userInfo)
        
    }
    
    @objc fileprivate func keyboardWillHide(_ notification : Notification) {
        ViewController.logKeyBoardInfo("keyboardWillHide", userInfo: notification.userInfo)
        let duration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        UIView.animate(withDuration: duration, delay: 0.0, options: [.beginFromCurrentState], animations: { [weak self] in
            self?.bottomAlignConstraint.constant = 0
            self?.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc fileprivate func keyboardDidHide(_ notification : Notification) {
        ViewController.logKeyBoardInfo("keyboardDidHide", userInfo: notification.userInfo)
    }
    
    @objc fileprivate func keyboardWillChangeFrame(_ notification : Notification) {
        ViewController.logKeyBoardInfo("keyboardWillChangeFrame", userInfo: notification.userInfo)
    }
    
    @objc fileprivate func keyboardDidChangeFrame(_ notification: Notification) {
        ViewController.logKeyBoardInfo("keyboardDidChangeFrame", userInfo: notification.userInfo)
    }

    //MARK: - Action
    
    @objc fileprivate func handleTap(_ gesture: UITapGestureRecognizer) {
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
            let animationCurve = UIViewAnimationCurve(rawValue: curveRawValue) {
            print("curveRawValue = \(curveRawValue)")
        }
    
        print("--------\(methodName)--------\n")
    }
}
