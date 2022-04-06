//
//  Dlog.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import SwiftUI
import Foundation

public func Dlog<T>(_ message: T, fileName: String = #file, methodName: String =  #function, lineNumber: Int = #line)
{
    #if DEBUG
    
    let str = (fileName as NSString).pathComponents.last!.replacingOccurrences(of: "swift", with: "")
    print(">>> \(str)\(methodName)[\(lineNumber)]: \(message)")
    #endif
}
