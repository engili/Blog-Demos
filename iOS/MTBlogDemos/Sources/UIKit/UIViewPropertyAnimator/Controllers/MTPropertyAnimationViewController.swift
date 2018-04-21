//
//  MTPropertyAnimationViewController.swift
//  MTBlogDemos
//
//  Created by LiMengtian on 2018/4/9.
//  Copyright © 2018 LiMengtian. All rights reserved.
//

import UIKit

class MTPropertyAnimationViewController: MTViewController {

    fileprivate var animationView: UIView!
    fileprivate var animator: UIViewPropertyAnimator!
    
    fileprivate var interruptableAnimtionView: UIView!
    fileprivate var interruptableAnimator: UIViewPropertyAnimator?
    
    fileprivate var progressWhenInterrupted: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Button
        let button = UIButton(frame: CGRect(x: 0, y: 100, width: 50, height: 50))
        button.backgroundColor = .orange
        button.setTitle("start", for: .normal)
        button.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        self.view.addSubview(button)

        //
        animationView = UIView(frame: CGRect(x: 0, y: 200, width: 100, height: 100))
        animationView.backgroundColor = .red
        self.view.addSubview(animationView)
        
        //panGesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        animationView.addGestureRecognizer(panGesture)
        
        
        
        
        //
        interruptableAnimtionView = UIView(frame: CGRect(x: 0, y: 400, width: 100, height: 100))
        interruptableAnimtionView.backgroundColor = .blue
        self.view.addSubview(interruptableAnimtionView)
        
        let interruptablePanGesture = UIPanGestureRecognizer(target: self, action: #selector(handleInterruptableGesture(_:)))
        interruptableAnimtionView.addGestureRecognizer(interruptablePanGesture)
        
        
    }
    

    //MARK: - Action
    @objc fileprivate func handleClick() {
        
        let offset = UIScreen.main.bounds.width - 100
        
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeOut) {
            self.animationView.frame = self.animationView.frame.offsetBy(dx: offset, dy: 0)
        }
        animator.startAnimation()
    }
    
    @objc fileprivate func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        let offset = UIScreen.main.bounds.width - 100
        switch gestureRecognizer.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeOut, animations: {
                self.animationView.frame = self.animationView.frame.offsetBy(dx: offset, dy: 0)
            })
            animator.pauseAnimation()
        case .changed:
            let translation = gestureRecognizer.translation(in: self.animationView)
            animator.fractionComplete = translation.x / offset
        case .cancelled, .ended:
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            break
        default:
            break
        }
    }
    
    @objc fileprivate func handleInterruptableGesture(_ gesture: UIPanGestureRecognizer) {
        
        let offset = UIScreen.main.bounds.width - 100
        
        switch gesture.state {
        case .began:
            if interruptableAnimator == nil {
                interruptableAnimator = UIViewPropertyAnimator(duration: 3.0, curve: .easeOut, animations: {
                    self.interruptableAnimtionView.frame = self.interruptableAnimtionView.frame.offsetBy(dx: offset, dy: 0)
                })
            }
            interruptableAnimator!.pauseAnimation()
            progressWhenInterrupted = interruptableAnimator!.fractionComplete
        case .changed:
            let translation = gesture.translation(in: self.interruptableAnimtionView)
            interruptableAnimator!.fractionComplete = (translation.x / offset) + progressWhenInterrupted
            
        case .ended, .cancelled:
            let timing = UICubicTimingParameters(animationCurve: .easeOut)
            interruptableAnimator!.continueAnimation(withTimingParameters: timing, durationFactor: 0)
        default:
            break
        }
        
    }
    
}
