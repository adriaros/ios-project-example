//
//  WelcomeProtocols.swift
//  ios-project-example
//
//  Created by Adrià Ros on 03/01/2020.
//  Copyright © 2020 adriaros. All rights reserved.
//

import Foundation
import UIKit

protocol WelcomePresenterToViewProtocol: class {
}

protocol WelcomeInteractorToPresenterProtocol: class {
}

protocol WelcomePresenterToInteractorProtocol: class {
    var presenter: WelcomeInteractorToPresenterProtocol? { get set }
}

protocol WelcomeViewToPresenterProtocol: class {
    var view: WelcomePresenterToViewProtocol? { get set }
    var interactor: WelcomePresenterToInteractorProtocol? { get set }
    var router: WelcomePresenterToRouterProtocol? { get set }
    func setupView()
}

protocol WelcomePresenterToRouterProtocol: class {
    var coordinator: CoordinatorProtocol? { get set }
    static func createModule(coordinator: CoordinatorProtocol?) -> UIViewController
}
