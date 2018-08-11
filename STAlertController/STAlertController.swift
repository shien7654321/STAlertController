//
//  STAlertController.swift
//  STAlertController
//
//  Created by Suta on 2018/8/11.
//  Copyright © 2018年 Suta. All rights reserved.
//

import Foundation
import UIKit

public class STAlertController: UIAlertController {
    
    fileprivate var finishHandler: (() -> Void)?
    
    override public func addAction(_ action: UIAlertAction) {
        action.alertController = self
        super.addAction(action)
    }
    
}

// MARK: -

public class STAlertAction: UIAlertAction {
    
    private init(title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
        
    }
    
    @objc override public class func createAction(title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        let realHandler: ((UIAlertAction) -> Void) = handler != nil ? { action in
            handler!(action)
            action.alertController?.finishHandler?()
            } : { action in
                action.alertController?.finishHandler?()
        }
        return super.createAction(title: title, style: style, handler: realHandler)
    }
    
}

private var kAlertActionAlertControllerKey: Void?

extension UIAlertAction {
    
    fileprivate var alertController: STAlertController? {
        get {
            return objc_getAssociatedObject(self, &kAlertActionAlertControllerKey) as? STAlertController
        }
        set {
            objc_setAssociatedObject(self, &kAlertActionAlertControllerKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    @objc fileprivate class func createAction(title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        return UIAlertAction(title: title, style: style, handler: handler)
    }
    
}

// MARK: -

private var kAlertsInfoKey: Void?

extension UIViewController {
    
    private struct STAlertInfo {
        
        var alertController: STAlertController
        var completionHandler: (() -> Void)?
        
    }
    
    private var alertsInfo: [STAlertInfo]? {
        get {
            return objc_getAssociatedObject(self, &kAlertsInfoKey) as? [STAlertInfo]
        }
        set {
            objc_setAssociatedObject(self, &kAlertsInfoKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func presentAlertController(_ alertController: STAlertController, completion: (() -> Void)? = nil) {
        let handler = {
            var alertInfoArray = self.alertsInfo != nil ? self.alertsInfo! : [STAlertInfo]()
            let alertInfo = STAlertInfo(alertController: alertController, completionHandler: completion)
            alertInfoArray.append(alertInfo)
            self.alertsInfo = alertInfoArray
            if alertInfoArray.count == 1 {
                self.presentNextAlert()
            }
        }
        if Thread.isMainThread {
            handler()
        } else {
            DispatchQueue.main.async {
                handler()
            }
        }
    }
    
    private func presentNextAlert() {
        guard presentedViewController == nil else {
            return
        }
        guard let alertInfoArray = alertsInfo, alertInfoArray.count > 0 else {
            return
        }
        let alertInfo = alertInfoArray.first!
        alertInfo.alertController.finishHandler = { [weak self] in
            self?.finishPresentAlert()
        }
        present(alertInfo.alertController, animated: true, completion: alertInfo.completionHandler)
    }
    
    private func finishPresentAlert() {
        guard var alertInfoArray = alertsInfo, alertInfoArray.count > 0 else {
            return
        }
        alertInfoArray.remove(at: 0)
        alertsInfo = alertInfoArray
        presentNextAlert()
    }
    
}
