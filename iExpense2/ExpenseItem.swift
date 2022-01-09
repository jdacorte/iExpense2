//
//  ExpenseItem.swift
//  iExpense2
//
//  Created by John DaCorte on 1/1/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
