//
//  IssuesTest.swift
//  ReboBankAssignment
//
//  Created by Naveen on 07/08/17.
//  Copyright © 2017 Cognizant Tech Solution. All rights reserved.
//

import XCTest

@testable import ReboBankAssignment

class IssuesTest: XCTestCase {
        
    override func setUp() {
        
        super.setUp()
        
    
    }
    
    func test_Init_WhenGivenValuesAssigned() {
        
        let issueTest = Issues(firstName: "Naveen", surNmae: "Kumar", issuesCount: 4, dateOfBirth:"2017-08-07")
        XCTAssertEqual(issueTest.firstName, "Naveen", "should set firstName")
    }
       override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
}
