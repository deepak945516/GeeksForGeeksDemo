//
//  NonUIExtensions.swift
//  Demo
//

import Foundation

// MARK: - NSObject
extension NSObject {
    class var className: String {
        self.classForCoder().description().components(separatedBy: ".").last!
    }
}
