//
//  IssueListViewControllerTest.swift
//  ReboBankAssignment
//
//  Created by Naveen on 08/08/17.
//  Copyright © 2017 Cognizant Tech Solution. All rights reserved.
//

import XCTest

@testable import ReboBankAssignment

class IssueListViewControllerTest: XCTestCase {
    
    var viewControllerTest = IssuesListViewController()
    var sut: IssuesListViewController!

    override func setUp() {
        super.setUp()
        self.viewControllerTest.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
         viewControllerTest = navigationController.topViewController as! IssuesListViewController

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNavigationBarAvailble() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        viewControllerTest = navigationController.topViewController as! IssuesListViewController
        XCTAssertFalse((viewControllerTest.navigationController?.isNavigationBarHidden)!, "nav bar should be showing by default")
  }
   
    
    func testThatViewLoads() {
        XCTAssertNotNil(self.viewControllerTest.view)
    }
    
    func testParentViewHasTableViewSubview() {
        let subviews = self.viewControllerTest.view.subviews
        XCTAssertTrue(subviews.contains(self.viewControllerTest.issueListTable),"View have a table subview");
    }
    func testTableViewHasDataToLoad() {
        XCTAssertLessThan(self.viewControllerTest.issuesListData.count, 1)
    }
   
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}



    


