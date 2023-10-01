//
//  CashSideEffectsTests.swift
//  CashTests
//
//  Created by degs on 01/10/2023.
//

import XCTest
@testable import Cash

import Combine

final class CashSideEffectsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_sideEffects_fetchExpenses() {
        let service = MockService()
        let sideEffect = cashSideEffects(service: service)
        if let sideEffect = sideEffect(CashState(), .fetchExpenses) {
            _ = sideEffect.sink { action in
                switch action {
                case .expensesFetched(let expenses):
                    XCTAssertEqual(expenses, service.expensesToPublish)
                default:
                    XCTFail("cashSideEffect returned action: \(action)")
                }
            }
        } else {
            XCTFail("SideEffect could not be constructed")
        }
    }

}

final class MockService: Service {
    
    var expensesToPublish = [Expense(name: "published_expense1",
                                     value: 10),
                             Expense(name: "published_expense2",
                                     value: 20)]
    func retrieveExpenses() -> AnyPublisher<[Expense], Never> {
        return Just(expensesToPublish)
        .eraseToAnyPublisher()
    }
    
}
