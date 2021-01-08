//
//  ViewController.swift
//  yybase
//
//  Created by Yamyee on 01/08/2021.
//  Copyright (c) 2021 Yamyee. All rights reserved.
//

import UIKit
import yybase


class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        isGestureBackEnable = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setBackButton { (button) in
            button.frame = CGRect(x: 0, y: 0, width: 120, height: 65)
            button.setTitle("返回", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 15)
        }
        
        
        let button = UIButton(type: .custom)
        button.frame.size = CGSize(width: 120, height: 50)
        button.center = view.center
        button.setTitle("跳转", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(push(_:)), for: .touchUpInside)
    }
    @IBAction @objc func push(_ sender: Any) {
        
        safePushViewController(ViewController())
    }
    
}

