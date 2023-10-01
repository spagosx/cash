//
//  Store.swift
//  Cash
//
//  Created by degs on 01/10/2023.
//

import Foundation
import Combine

typealias CashStore = Store<CashState, CashAction>
typealias SideEffect<State, Action> = (State, Action) -> AnyPublisher<Action, Never>?

final class Store<State, Action>: ObservableObject {
    
    @Published private(set) var state: State
    
    private let reducer: Reducer<State, Action>
    let sideEffects: [SideEffect<State, Action>]
    private var sideEffectsCancellables: Set<AnyCancellable> = []
    
    init(initialState: State,
         reducer: @escaping Reducer<State, Action>,
         sideEffects: [SideEffect<State, Action>]) {
        self.state = initialState
        self.reducer = reducer
        self.sideEffects = sideEffects
    }
    
    func dispatch(_ action: Action) {
        reducer(&state, action)
        
        for sideEffect in sideEffects {
            guard let sideEffect = sideEffect(state, action) else {
                break
            }
            
            sideEffect
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: dispatch)
                .store(in: &sideEffectsCancellables)
        }
    }
}
