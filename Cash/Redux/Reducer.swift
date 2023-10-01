//
//  Reducer.swift
//  Cash
//
//  Created by degs on 01/10/2023.
//

import Foundation

typealias Reducer<State, Action> = (inout State, Action) -> Void

// TODO: remove the inout and return a fresh State instead
func cashReducer(state: inout CashState, action: CashAction) {
    switch action {
    case .addExpense(let expense):
        state.expenses.append(expense)
    case .expensesFetched(let expenses):
        state.expenses = expenses
        state.loading = false
    case .fetchExpenses:
        state.loading = true
    }
}
