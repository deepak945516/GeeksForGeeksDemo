//
//  BaseViewController.swift
//  Demo
//

import UIKit

class BaseViewController: UIViewController {
    // MARK: - Properties
    private var activityIndicator: UIActivityIndicatorView!
    private let activityIndicatorWidthHeight: CGFloat = 50
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
    }
    
    // MARK: - Private Methods
    private func setupActivityIndicator() {
        let activityIndicatorFrame = CGRect(x: (view.frame.width - activityIndicatorWidthHeight) / 2, y: (view.frame.height - activityIndicatorWidthHeight) / 2, width: activityIndicatorWidthHeight, height: activityIndicatorWidthHeight)
        activityIndicator = UIActivityIndicatorView(frame: activityIndicatorFrame)
        activityIndicator.style = .whiteLarge
        activityIndicator.color = .blue
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
    
    func showActivityIndicator() {
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
    }
}
