//
//  Action.swift
//  Cash
//
//  Created by degs on 01/10/2023.
//

import Foundation

enum CashAction {
    case fetchExpenses
    case addExpense(_ expense: Expense)
    case expensesFetched(_ expenses: [Expense])
}
