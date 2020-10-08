//
//  HomeCoordinatorTests.swift
//  ThankYouTokensTests
//
//  Created by Robin Lopez Ordonez on 10/8/20.
//

import XCTest
@testable import ThankYouTokens

class HomeCoordinatorTests: XCTestCase {

    let coord = HomeCoordinator(navigationController: UINavigationController())
    
    func test_nav_bar_should_be_hidden() {
        XCTAssertTrue(coord.navigationController.isNavigationBarHidden)
    }
    
    //NavigationController should not have any viewcontrollers to start with
    func test_navigation_controller_should_not_have_any_viewcontrollers() {
        XCTAssertTrue(coord.navigationController.viewControllers.count == 0)
    }
    
    //Top most viewcontroller on the stack should be HomeViewController
    func test_check_home_viewcontroller() {
        coord.start()
        XCTAssertTrue(coord.navigationController.topViewController is HomeViewController)
    }
    
    //Once coordinator is started, it should have only one view controller in the stack
    func test_navigation_controller_should_have_one_viewcontroller() {
        coord.start()
        XCTAssertTrue(coord.navigationController.viewControllers.count == 1)
    }

}
