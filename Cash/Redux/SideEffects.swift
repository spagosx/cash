//
//  SideEffects.swift
//  Cash
//
//  Created by degs on 01/10/2023.
//

import Foundation
import Combine

// TODO: turning this into a struct with a handle(state: action:) func might be nicer and easier to test
func cashSideEffects(service: Service) -> SideEffect<CashState, CashAction> {
    return {  state, action in
        
        switch action {
        case .fetchExpenses:
            return service.retrieveExpenses()
                .subscribe(on: DispatchQueue.main)
                .map { CashAction.expensesFetched($0) }
                .eraseToAnyPublisher()
        default:
            break
        }
        return Empty().eraseToAnyPublisher() // TODO: return nil and use a flatmap in the Store
    }
}
