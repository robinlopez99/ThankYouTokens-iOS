//
//  CreateAccountCoordinatorTests.swift
//  ThankYouTokensTests
//
//  Created by Robin Lopez Ordonez on 11/2/20.
//

import XCTest
@testable import ThankYouTokens

class CreateAccountCoordinatorTests: XCTestCase {

    let coord = CreateAccountCoordinator(navigationController: UINavigationController())
    
    func test_nav_bar_should_show() {
        XCTAssertTrue(!coord.navigationController.isNavigationBarHidden)
    }
    
    //NavigationController should not have any viewcontrollers to start with
    func test_navigation_controller_should_not_have_any_viewcontrollers() {
        XCTAssertTrue(coord.navigationController.viewControllers.count == 0)
    }
    
    //Top most viewcontroller on the stack should be HomeViewController
    func test_check_home_viewcontroller() {
        coord.start()
        XCTAssertTrue(coord.navigationController.topViewController is CreateAccountViewController)
    }
    
    //Once coordinator is started, it should have only one view controller in the stack
    func test_navigation_controller_should_have_one_viewcontroller() {
        coord.start()
        XCTAssertTrue(coord.navigationController.viewControllers.count == 1)
    }


}
