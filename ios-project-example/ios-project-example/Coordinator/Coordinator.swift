//
//  Coordinator.swift
//  ios-project-example
//
//  Created by Adrià Ros on 03/01/2020.
//  Copyright © 2020 adriaros. All rights reserved.
//

import UIKit

enum TransitionType {
    case launch
}

protocol CoordinatorProtocol {
    func transition(to scene: UIViewController?, type: TransitionType?)
}

final class Coordinator: CoordinatorProtocol {
    
    let window: UIWindow?
    var navigationControler: UINavigationController?
    var currentViewController: UIViewController?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func transition(to scene: UIViewController?, type: TransitionType?) {
        
        guard let vc = scene else { fatalError("Coordinator --> ViewController does not exist") }
        currentViewController = vc
        
        switch type {
        case .launch:
            navigationControler = UINavigationController(rootViewController: vc)
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
        case .none:
            fatalError("Coordinator --> transition type does not exist")
        }
    }
}
