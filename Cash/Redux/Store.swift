//
//  Store.swift
//  Cash
//
//  Created by degs on 01/10/2023.
//

import Foundation

typealias CashStore = Store<CashState, CashAction>

final class Store<State, Action>: ObservableObject {
    
    @Published private(set) var state: State
    
    private let reducer: Reducer<State, Action>
    
    init(initialState: State, reducer: @escaping Reducer<State, Action>) {
        self.state = initialState
        self.reducer = reducer
    }
    
    func dispatch(_ action: Action) {
        reducer(&state, action)
    }
}
