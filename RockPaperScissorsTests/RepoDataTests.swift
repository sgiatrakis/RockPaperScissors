//
//  RepoDataTests.swift
//  RockPaperScissorsTests
//
//  Created by Lysimachos Giatrakis on 4/1/22.
//

import XCTest
@testable import RockPaperScissors

class RepoDataTests: XCTestCase {
    
    var repo: Repository?

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        repo = Repository.shared
    }

    override func tearDownWithError() throws {
        repo = nil
        try super.tearDownWithError()
    }

    func testRepoData() throws {
        let expectation = XCTestExpectation(description: "fetchRepoData")
        defer { wait(for: [expectation], timeout: TimeInterval(10)) }
        
        repo?.fetchBTCPrices(completion: { response, error in
            defer {expectation.fulfill() }
            guard error == nil, let response = response else {
                XCTFail(error.debugDescription) //if  error failed
                return
            }
            XCTAssertNotNil(response) //if nil failed
        })
    }


}
