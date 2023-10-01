//
//  CashStore.swift
//  Cash
//
//  Created by degs on 01/10/2023.
//

import Foundation
import Combine

protocol Service {
    func retrieveExpenses() -> AnyPublisher<[Expense], Never>
}

struct CashService: Service {
    func retrieveExpenses() -> AnyPublisher<[Expense], Never> {
        return Future<[Expense], Never> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                promise(.success([Expense(name: "Mortgage", value: 1000)]))
            }
        }.eraseToAnyPublisher()
    }
}
