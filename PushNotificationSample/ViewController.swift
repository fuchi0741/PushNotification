//
//  ViewController.swift
//  PushNotificationSample
//
//  Created by 渕一真 on 2021/04/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func pushWithFirebase(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main",bundle: nil)  //手順1で説明済
        guard let viewController = storyboard.instantiateInitialViewController() as? ShirtsListViewController else { return }  //インスタンス化したものを定数viewControllerとして定義
        navigationController?.pushViewController(viewController, animated: true)
    }

}

