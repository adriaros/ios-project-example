//
//  WelcomePresenter.swift
//  ios-project-example
//
//  Created by Adrià Ros on 03/01/2020.
//  Copyright © 2020 adriaros. All rights reserved.
//

import Foundation
import UIKit

class WelcomePresenter: WelcomeViewToPresenterProtocol {
    
    var view: WelcomePresenterToViewProtocol?
    var interactor: WelcomePresenterToInteractorProtocol?
    var router: WelcomePresenterToRouterProtocol?
    
    func setupView() {
    }
}

extension WelcomePresenter: WelcomeInteractorToPresenterProtocol {
    
}
