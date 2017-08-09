//
//  IssuesListViewModelTest.swift
//  ReboBankAssignment
//
//  Created by Naveen on 08/08/17.
//  Copyright © 2017 Cognizant Tech Solution. All rights reserved.
//

import XCTest
@testable import ReboBankAssignment

class IssuesListViewModelTest: XCTestCase {
    
    var issueListViewModelTest = IssuesListViewModel.init()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testCSVfileDataLoaded() {
//        let issueListViewModelTestTemp = IssuesListViewModel.init()
//        XCTAssertLessThan(issueListViewModelTestTemp.loadData().count, 1)
//    }
    
    func testformatDate() {
        
        let inputString = "2001-04-20T00:00:00"
        let resultString = "20-04-2001"
        XCTAssertEqual(issueListViewModelTest.formatDate(dateString: inputString), resultString)
        
    }
    
    func testparseCSVFileString() {
        let inputString = "First Name,Sur Name,Issue Count,Date of Birth\r\nTheo,Jonsen,5,1978-01-02T00:00:00\r\nFiona,de Vries,7,1950-11-12T00:00:00\r\n"
        XCTAssertTrue(issueListViewModelTest.parseCSVFileString(dataString: inputString)
)
        
    }
    
    func testformIssuesListArray() {
        let inputArray = [["Theo", "Jonsen", "5", "1978-01-02T00:00:00"], ["Fiona", "de Vries", "7", "1950-11-12T00:00:00"], ["Petra", "Boersma", "1", "2001-04-20T00:00:00"]]
        issueListViewModelTest.formIssuesListArray(parameter:inputArray, completion: { response in
            XCTAssertEqual(inputArray.count, self.issueListViewModelTest.issuesList.count)

        })
        
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
