//
//  AppCoordinatorTests.swift
//  ThankYouTokensTests
//
//  Created by Robin Lopez Ordonez on 9/27/20.
//

import XCTest
@testable import ThankYouTokens

class AppCoordinatorTests: XCTestCase {
    
    //check delegates
    
    let coord = AppCoordinator(navigationController: UINavigationController())
    
    //Navigation Bar should be hidden when app starts
    func test_nav_bar_should_be_hidden() {
        XCTAssertTrue(coord.navigationController.isNavigationBarHidden)
    }
    
    //Child coordinators list should be empty at start
    func test_child_coordinators_should_be_empty() {
        XCTAssertTrue(coord.childCoordinators.isEmpty)
    }
    
    //Child coordinators list should not be empty after calling showLogin()
    func test_child_coordinator_should_not_be_empty_after_showLogin() {
        coord.showLogin()
        XCTAssertFalse(coord.childCoordinators.isEmpty)
    }
    
    
    
    

}
