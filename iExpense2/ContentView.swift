//
//  ContentView.swift
//  iExpense2
//
//  Created by John DaCorte on 1/1/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach (expenses.items) { item in
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        
                        if item.amount < 10{
                            Text(item.amount, format: .currency(code: "USD"))
                            .foregroundColor(.green)
                        } else if item.amount < 100 {
                            Text(item.amount, format: .currency(code: "USD"))
                            .foregroundColor(.yellow)
                        }
                        else {
                            Text(item.amount, format: .currency(code: "USD"))
                            .foregroundColor(.red)
                        }
                                    
                    }
                }
                .onDelete(perform: removeItems)
              
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
