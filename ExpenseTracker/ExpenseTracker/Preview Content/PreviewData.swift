//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by user223323 on 11/28/22.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, date: "11/28/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 001, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData =  [Transaction](repeating: transactionPreviewData, count: 10)
