//
//  UIExtensions.swift
//  Demo
//

import UIKit

// MARK: - UIView
extension UIView {
	@IBInspectable
	var cornerRadius: CGFloat {
		get {
			layer.cornerRadius
		} set {
			layer.cornerRadius = newValue
			layer.masksToBounds = true
		}
	}
}
