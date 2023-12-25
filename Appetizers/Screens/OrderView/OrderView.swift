//
//  OrderView.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 22.12.2023.
//

import SwiftUI

struct OrderView: View {
    @State
    private var ordersList: [Appetizer] = [MockData.sampleAppetizerOne,MockData.sampleAppetizerTwo,MockData.sampleAppetizerThree]
    
    var totalPrice: Double {
        var t: Double = 0
        ordersList.forEach { order in
            t += order.price
        }
        return t
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(ordersList) { order in
                            AppetizerListCell(appetizer: order)
                        }
                        .onDelete(perform: deleteItem)
                    }
                    .listStyle(.plain)
                    Spacer()
                    APButton(title: "\(totalPrice.formatted(.currency(code: "USD"))) - Place Order")
                        .padding(.bottom,25)
                }
                if ordersList.isEmpty {
                    EmptyState(imageResource: .emptyOrder, message: "You have no items in your order. Please add an appetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
            
            
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        ordersList.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
