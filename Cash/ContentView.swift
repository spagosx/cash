//
//  ContentView.swift
//  Cash
//
//  Created by degs on 01/10/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: CashStore
    var body: some View {
        VStack {
            List(store.state.expenses) { expense in
                HStack {
                    Text("\(expense.name)")
                    Text("\(expense.value)")
                }
            }
            .padding()
            Button("Add Expense") {
                store.dispatch(.addExpense(Expense(name: "New Expense", value: 100)))
            }
        }
    }
}
