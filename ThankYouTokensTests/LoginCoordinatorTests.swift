//
//  LoginCoordinatorTests.swift
//  ThankYouTokensTests
//
//  Created by Robin Lopez Ordonez on 10/7/20.
//

import XCTest
@testable import ThankYouTokens

class LoginCoordinatorTests: XCTestCase {

    let coord = LoginCoordinator(navigationController: UINavigationController())
    
    
    func test_nav_bar_should_be_hidden() {
        XCTAssertTrue(coord.navigationController.isNavigationBarHidden)
    }
    
    //There should be no viewcontrollers in the stack at initialization
    func test_navigation_controller_should_not_have_any_viewcontrollers() {
        XCTAssertTrue(coord.navigationController.viewControllers.count == 0)
    }
    
    
    //presenting viewcontroller should be login view controller
    func test_check_login_viewcontroller() {
        coord.start()
        XCTAssertTrue(coord.navigationController.topViewController is LoginViewController)
    }
    
    //Once coordinator is started, it should have only one view controller in the stack
    func test_navigation_controller_should_have_one_viewcontroller() {
        coord.start()
        XCTAssertTrue(coord.navigationController.viewControllers.count == 1)
    }
    

}
