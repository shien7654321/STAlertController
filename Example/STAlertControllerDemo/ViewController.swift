//
//  ViewController.swift
//  STAlertControllerDemo
//
//  Created by Suta on 2018/8/11.
//  Copyright © 2018年 Suta. All rights reserved.
//

import UIKit
import STAlertController

class ViewController: UIViewController {
    
    @IBAction func btnPresentSomeSTAlertControllerClicked(_ sender: UIButton) {
        let alertControllerCount = Int(arc4random() % 10) + 1
        let title = Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as! String
        for alertControllerIndex in 0 ..< alertControllerCount {
            let alertController = STAlertController(title: title, message: "index: \(alertControllerIndex)", preferredStyle: (arc4random() % 100) < 50 ? .alert : .actionSheet)
            let alertActionCount = Int(arc4random() % 5)
            for alertActionIndex in 0 ..< alertActionCount {
                let alertAction = STAlertAction.createAction(title: "action: \(alertActionIndex)", style: alertActionIndex == alertActionCount - 1 ? .cancel : .default) { action in
                    print("action clicked: \(action.title!)")
                }
                alertController.addAction(alertAction)
            }
            presentAlertController(alertController) {
                if alertActionCount == 0 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                        alertController.dismissAlertController(animated: true)
                    })
                }
            }
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
