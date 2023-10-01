//
//  Reducer.swift
//  Cash
//
//  Created by degs on 01/10/2023.
//

import Foundation

typealias Reducer<State, Action> = (inout State, Action) -> Void

func cashReducer(state: inout CashState, action: CashAction) {
    switch action {
        case .addExpense(let expense):
        state.expenses.append(expense)
    }
}
