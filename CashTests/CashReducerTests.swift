//
//  CashTests.swift
//  CashTests
//
//  Created by degs on 01/10/2023.
//

import XCTest
@testable import Cash

final class CashReducerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_cashReducer_fetchExpenses_state() {
        var state = CashState()
        cashReducer(state: &state, action: .fetchExpenses)
        XCTAssertTrue(state.loading)
    }
    
    func test_cashReducer_addExpense_state() {
        var state = CashState()
        let expense = Expense(name: "mock_expense", value: 100)
        cashReducer(state: &state, action: .addExpense(expense))
        XCTAssertEqual(state.expenses.count, 1)
        XCTAssertEqual(state.expenses.first!, expense)
    }
    
    func test_cashReducer_expensesFetched_state() {
        var state = CashState()
        let expenses = [
            Expense(name: "mock_expense1", value: 100),
            Expense(name: "mock_expense2", value: 100)
        ]
        cashReducer(state: &state, action: .expensesFetched(expenses))
        XCTAssertEqual(state.expenses, expenses)
    }
}
