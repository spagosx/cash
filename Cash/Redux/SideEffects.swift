//
//  SideEffects.swift
//  Cash
//
//  Created by degs on 01/10/2023.
//

import Foundation
import Combine

func cashSideEffects(service: CashService) -> SideEffect<CashState, CashAction> {
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
        return Empty().eraseToAnyPublisher()
    }
}
