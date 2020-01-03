//
//  iOSPE_Unit_Tests.swift
//  iOSPE-Unit-Tests
//
//  Created by Adrià Ros on 28/12/2019.
//  Copyright © 2019 adriaros. All rights reserved.
//

import XCTest
@testable import iOSPE

class CoordinatorTests: XCTestCase {
    
    var window: UIWindow?
    var sut: CoordinatorProtocol?

    override func setUp() {
        super.setUp()
        window = UIWindow()
        sut = Coordinator(window: window)
    }

    override func tearDown() {
        window = nil
        sut = nil
        super.tearDown()
    }

    func test_coordinator_transition_launch() {
        // Given
        let vc = WelcomeRouter.createModule(coordinator: sut) as! WelcomeViewController
        
        // When
        sut?.transition(to: vc, type: .launch)
        
        // Then
        XCTAssertTrue(window?.rootViewController == vc)
    }
}
