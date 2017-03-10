//
//  WDKeyboardManagerSwift.swift
//  WDKeyboardManagerSwift
//
//  Created by Vladimir Dinic on 3/10/17.
//  Copyright © 2017 Vladimir Dinic. All rights reserved.
//

import UIKit
import Foundation

class WDKeyboardManagerSwift: NSObject {

    static let offsetFromKeyboard:CGFloat = 10.0
    static let sharedInstance = WDKeyboardManagerSwift()
    
    var window: UIWindow?
    var tapGesture: UITapGestureRecognizer?
    var keyboardOffset: Double = 0.0
    var firstResponder: UIView?
    var keyboardFrameBeginRect = CGRect.zero
    
    override init() {
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidAppear), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.didBeginEditing), name: NSNotification.Name.UITextFieldTextDidBeginEditing, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.didBeginEditing), name: NSNotification.Name.UITextViewTextDidBeginEditing, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.orientationChanged), name: Notification.Name.UIDeviceOrientationDidChange, object: nil)
        
    }
    
    func orientationDidChange() {
        firstResponder?.endEditing(true)
        window = UIApplication.shared.keyWindow
        UIView.animate(withDuration: 0.25, animations: {() -> Void in
            self.window?.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat((self.window?.frame.size.width)!), height: CGFloat((self.window?.frame.size.height)!))
        }, completion: {(_ finished: Bool) -> Void in
            self.keyboardOffset = 0
            self.keyboardFrameBeginRect = CGRect.null
            self.firstResponder?.becomeFirstResponder()
        })
    }
    
    func orientationChanged() {
        firstResponder?.endEditing(true)
        window = UIApplication.shared.keyWindow
        UIView.animate(withDuration: 0.25, animations: {() -> Void in
            self.window?.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat((self.window?.frame.size.width)!), height: CGFloat((self.window?.frame.size.height)!))
        }, completion: {(_ finished: Bool) -> Void in
            self.keyboardOffset = 0
            self.keyboardFrameBeginRect = CGRect.null
            self.firstResponder?.becomeFirstResponder()
        })
    }
    
    func addGestureToWindow() {
        if tapGesture == nil {
            tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureAction))
            window?.addGestureRecognizer(tapGesture!)
        }
    }
    
    func tapGestureAction() {
        window?.endEditing(true)
        firstResponder = nil
        UIView.animate(withDuration: 0.25, animations: {() -> Void in
            self.window?.frame = CGRect(x:0, y:0, width:(self.window?.frame.size.width)!, height:(self.window?.frame.size.height)!)
        })
    }
    
    func didBeginEditing(_ notification: Notification) {
        if (firstResponder != nil) {
            keyboardOffset = 0.0
            UIView.animate(withDuration: 0.25, animations: {() -> Void in
                self.window?.frame = CGRect(x: CGFloat(0), y: CGFloat(-self.keyboardOffset), width: CGFloat((self.window?.frame.size.width)!), height: CGFloat((self.window?.frame.size.height)!))
            })
        }
        firstResponder = notification.object as! UIView?
    }
    
    func keyboardDidAppear(notification: NSNotification) {
        if window == nil {
            window = UIApplication.shared.keyWindow
        }
        if (self.window != nil) {
            self.addGestureToWindow()
            if (firstResponder != nil) {
                if keyboardFrameBeginRect.isEmpty {
                    var keyboardInfo = notification.userInfo!
                    let keyboardFrameBegin = (keyboardInfo[UIKeyboardFrameBeginUserInfoKey] as! CGRect)
                    keyboardFrameBeginRect = keyboardFrameBegin
                }
                let firstResponderFrame = firstResponder?.frame
                let originalFirstResponderFrame = firstResponder?.superview!.convert(firstResponderFrame!, to: nil)
                let value1 = (originalFirstResponderFrame?.origin.y)! + (originalFirstResponderFrame?.size.height)! + WDKeyboardManagerSwift.offsetFromKeyboard
                let value2 = keyboardFrameBeginRect.origin.y - keyboardFrameBeginRect.size.height
                if value1 > value2
                {
                    keyboardOffset = Double((originalFirstResponderFrame?.origin.y)! + (originalFirstResponderFrame?.size.height)! + WDKeyboardManagerSwift.offsetFromKeyboard - keyboardFrameBeginRect.origin.y + keyboardFrameBeginRect.size.height)
                }
                else {
                    keyboardOffset = 0
                }
                UIView.animate(withDuration: 0.25, animations: {() -> Void in
                    self.window!.frame = CGRect(x:0, y:-(CGFloat)(self.keyboardOffset), width:(self.window?.frame.size.width)!, height:(self.window?.frame.size.height)!)
                })
            }
        }
    }
}
