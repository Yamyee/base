//
//  UIViewController+extension.swift
//  Pods-yybase_Example
//
//  Created by yamyee on 2021/1/8.
//

import Foundation

extension UIViewController{
    
    public var backButton:UIButton?{
        return self.navigationItem.backBarButtonItem?.customView as? UIButton
    }
    
    public var isGestureBackEnable: Bool{
        set{
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = newValue
        }
        get{
            return self.navigationController?.interactivePopGestureRecognizer?.isEnabled ?? false
        }
    }
    
    public var isNavigationBarHidden :Bool{
        set{
            self.navigationController?.navigationBar.isHidden = newValue
        }
        get{
            return self.navigationController?.navigationBar.isHidden ?? true
        }
    }

    public func setBackButton(_ callback:(UIButton )->Void){
        guard let nav = self.navigationController else { return }
        let button = UIButton(type: .custom)
        callback(button)
        let item = UIBarButtonItem(customView: button)
        navigationItem.backBarButtonItem = item
    }
    
    public func setRightButton(_ callback:(UIButton)->Void){
        guard let _ = self.navigationController else { return }
        let button = UIButton(type: .custom)
        callback(button)
        let item = UIBarButtonItem(customView: button)
        
        self.navigationItem.rightBarButtonItem = item
    }
    
    public func setLeftButtons(count:Int,_ callback:([UIButton])->Void){
        guard let _ = self.navigationController,
              count > 0 else { return }
        var buttons = [UIButton]()

        for _ in 0..<count {
            let button = UIButton(type: .custom)
            buttons.append(button)
        }
        callback(buttons)
        
        var items = [UIBarButtonItem]()
        for button in buttons {
            let item = UIBarButtonItem(customView: button)
            items.append(item)
        }
        self.navigationItem.leftBarButtonItems = items
    }
    
    public func setRightButtons(count:Int,_ callback:([UIButton])->Void){
        guard let _ = self.navigationController,
              count > 0 else { return }
        var buttons = [UIButton]()

        for _ in 0..<count {
            let button = UIButton(type: .custom)
            buttons.append(button)
        }
        callback(buttons)
        
        var items = [UIBarButtonItem]()
        for button in buttons {
            let item = UIBarButtonItem(customView: button)
            items.append(item)
        }
        self.navigationItem.rightBarButtonItems = items
    }
}

extension UIViewController{
    
    public func safePushViewController(_ viewController:UIViewController,animated:Bool=true,completion:(()->())?=nil){
        if let nav = (self as? UINavigationController) ?? self.navigationController {
            nav.pushViewController(viewController, animated: animated)
            completion?()
        }else{
            var tempController:UIViewController? = self
            repeat {
                if (tempController == tempController?.navigationController?.topViewController) {

                    break
                } else {
                    tempController = tempController?.parent
                }

            } while (tempController?.parent != nil)
            tempController?.present(viewController, animated: animated, completion: completion)
        }
    }
}
