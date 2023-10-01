//
//  CashApp.swift
//  Cash
//
//  Created by degs on 01/10/2023.
//

import SwiftUI

@main
struct CashApp: App {
    var body: some Scene {
        WindowGroup {
            let store = CashStore(initialState: CashState(expenses: [Expense(name: "mortgage", value: 1000)]),
                                  reducer: cashReducer)
            ContentView().environmentObject(store)
        }
    }
}
