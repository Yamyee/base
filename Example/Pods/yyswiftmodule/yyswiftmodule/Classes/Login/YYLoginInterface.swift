//
//  YYLoginInterface.swift
//  yyswiftmodule
//
//  Created by yamyee on 2021/1/5.
//

import Foundation

public func YYLoginInterfaceInstance()->YYLoginInterface{
    return YYLoginCore()
}
public protocol YYLoginInterface {
    ///登录
    func login(_ account:String ,_ password:String)
}
