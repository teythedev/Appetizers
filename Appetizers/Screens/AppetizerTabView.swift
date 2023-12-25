//
//  ContentView.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 22.12.2023.
//

import SwiftUI
/// 9:08:00  da kaldim 
struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                    
                }
        }
        .tint(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
