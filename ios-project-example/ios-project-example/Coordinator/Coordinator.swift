//
//  Coordinator.swift
//  ios-project-example
//
//  Created by Adrià Ros on 03/01/2020.
//  Copyright © 2020 adriaros. All rights reserved.
//

import UIKit

enum NavigationBarLeft {
    case default_back
}

enum NavigationBarMiddle {
    case title(text: String)
}

enum NavigationBarRight {
    case none
}

enum TransitionType {
    case launch
}

protocol CoordinatorProtocol {
    func transition(to scene: UIViewController?, type: TransitionType?)
}

final class Coordinator: CoordinatorProtocol {
    
    private let window: UIWindow?
    private var currentViewController: UIViewController?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func transition(to scene: UIViewController?, type: TransitionType?) {
        
        guard let vc = scene else { fatalError("Coordinator --> ViewController does not exist") }
        currentViewController = vc
        
        switch type {
        case .launch:
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
            configure(vc)
        case .none:
            fatalError("Coordinator --> transition type does not exist")
        }
    }
    
    private func configure(_ target: UIViewController) {
        switch target {
        case is WelcomeViewController:
            customize()
        default:
            fatalError("Coordinator --> configure target does not exist")
        }
    }
    
    private func customize(left: NavigationBarLeft? = nil, middle: NavigationBarMiddle? = nil, right: NavigationBarRight? = nil, backgroundColor: UIColor? = nil) {
        
        var hide = true
        
        if let left = left {
            setupLeftBarButton(type: left)
            hide = false
        } else {
            disableLeftButton()
        }
        
        if let middle = middle {
            setupMiddleBarButton(type: middle)
            hide = false
        }
        
        if let right = right {
            setupRightBarButton(type: right)
            hide = false
        } else {
            disableRightButton()
        }
        
        if let backgroundColor = backgroundColor {
            hide = false
            currentViewController?.navigationController?.navigationBar.barTintColor = backgroundColor
        } else {
            currentViewController?.navigationController?.navigationBar.barTintColor = .white
            currentViewController?.navigationController?.navigationBar.isHidden = hide
        }
    }
    
    private func disableLeftButton() {
        currentViewController?.navigationItem.setLeftBarButton(nil, animated: false)
        currentViewController?.navigationItem.setHidesBackButton(true, animated: false)
        currentViewController?.navigationItem.leftBarButtonItem = nil
    }
    
    private func disableRightButton() {
        currentViewController?.navigationItem.setRightBarButton(nil, animated: false)
        currentViewController?.navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    private func setupLeftBarButton(type: NavigationBarLeft) {
        switch type {
        case .default_back:
            currentViewController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "coordinator_back_button").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(back(_:)))
        }
    }
    
    private func setupMiddleBarButton(type: NavigationBarMiddle) {
        switch type {
        case .title(let text):
            currentViewController?.navigationItem.title = text
            let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            currentViewController?.navigationController?.navigationBar.titleTextAttributes = textAttributes
        }
    }
    
    private func setupRightBarButton(type: NavigationBarRight) {
    }
    
    @IBAction func back(_ sender: Any) {
        self.pop(animated: true)
    }
    
    func pop(animated: Bool) {
        guard let navigation = currentViewController?.navigationController else { fatalError("Coordinator --> navigation controller does not exist") }
        guard navigation.popViewController(animated: animated) != nil else { fatalError("Coordinator --> Can't pop from \(String(describing: currentViewController))") }
        guard let previous = navigation.viewControllers.last else { fatalError("Coordinator --> previous ViewController does not exist") }
        currentViewController = previous
    }
}
