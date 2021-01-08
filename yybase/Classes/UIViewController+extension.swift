//
//  UIViewController+extension.swift
//  Pods-yybase_Example
//
//  Created by yamyee on 2021/1/8.
//

import Foundation

extension UIViewController{
    
    public func safePushViewController(_ viewController:UIViewController,animated:Bool=true,completion:(()->())?=nil){
        if let nav = self as? UINavigationController {
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
