//
//  State.swift
//  Cash
//
//  Created by degs on 01/10/2023.
//

import Foundation

struct CashState {
    var expenses: [Expense] = []
    var loading = false
}

struct Expense: Identifiable {
    let id = UUID()
    let name: String
    let value: Double
}

#if DEBUG
extension Expense: Equatable {} // for unit tests only
#endif
