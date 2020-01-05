//
//  WelcomeViewController.swift
//  ios-project-example
//
//  Created by Adrià Ros on 03/01/2020.
//  Copyright © 2020 adriaros. All rights reserved.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    var presenter: WelcomeViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setupView()
    }
}

extension WelcomeViewController: WelcomePresenterToViewProtocol {

}
