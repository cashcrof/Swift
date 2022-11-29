//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by user223323 on 11/28/22.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
            
        }
    }
}
