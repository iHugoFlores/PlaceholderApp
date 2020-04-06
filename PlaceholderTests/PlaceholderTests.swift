//
//  PlaceholderTests.swift
//  PlaceholderTests
//
//  Created by Field Employee on 4/6/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import XCTest

@testable import Placeholder

class PlaceholderTests: XCTestCase {
    
    var resData: [Photo]? = nil

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAPIDataFetch() throws {
        let completedExpectation = expectation(description: "Downloaded")
        PhotosAPI.downloadPhotoData { (data) in
            self.resData = data
            completedExpectation.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
        XCTAssertNotNil(resData, "Error while downloading the data")
        /*
        let pred = NSPredicate(format: "resData != nil")
        let exp = expectation(for: pred, evaluatedWith: self, handler: nil)
        let res = XCTWaiter.wait(for: [exp], timeout: 10.0)
        if res == XCTWaiter.Result.completed {
            XCTAssertNotNil(resData, "Data not recieved")
        } else {
            XCTAssert(false, "URL Call presented unexpected error")
        }
        */
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
