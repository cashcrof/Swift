//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by user223323 on 11/28/22.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        //var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24){
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    let data = transactionListVM.accumulateTransactions()
                    
                    if !data.isEmpty {
                        
                        let totalExpenses = data.last?.1 ?? 0
                        CardView {
                            VStack(alignment: .leading){                                ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title, format:"$%.02f")
                                LineChart()
                            }
                            .background(Color.systemBackground)
                        }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                        .frame(height: 300)
                    }
                    RecentTransactionList()
                        
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack).accentColor(.primary)
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static let transactionListVM: TransactionListViewModel = {
            let transactionListVM = TransactionListViewModel()
            transactionListVM.transactions = transactionListPreviewData
            return transactionListVM
        }()
        static var previews: some View {
            ContentView()
                .environmentObject(transactionListVM)
        }
       
    }
}
