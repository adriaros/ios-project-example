//
//  WelcomeRouter.swift
//  ios-project-example
//
//  Created by Adrià Ros on 03/01/2020.
//  Copyright © 2020 adriaros. All rights reserved.
//

import Foundation
import UIKit

class WelcomeRouter: WelcomePresenterToRouterProtocol {
    
    var coordinator: CoordinatorProtocol?
    
    class func createModule(coordinator: CoordinatorProtocol?) -> UIViewController {
        let view = WelcomeViewController()
        let presenter: WelcomeViewToPresenterProtocol & WelcomeInteractorToPresenterProtocol = WelcomePresenter()
        let interactor: WelcomePresenterToInteractorProtocol = WelcomeInteractor()
        let router: WelcomePresenterToRouterProtocol = WelcomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.coordinator = coordinator
        
        return view
    }
}
