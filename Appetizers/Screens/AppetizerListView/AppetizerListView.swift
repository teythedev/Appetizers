//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 22.12.2023.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject
    var viewModel: AppetizerListViewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle("🍟 Appetizers")
            }
            .task{
                await viewModel.getAppetizers()
            }
            if viewModel.isLoading {
                LoadingView()
                //ProgressView()
                   // .progressViewStyle(.circular)
                   // .tint(.brandPrimary)
                   // .font(.largeTitle)
            }
        }
        .alert(item: $viewModel.alertItem, content: { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        })
    }
    
}


#Preview {
    AppetizerListView()
}




extension String {
    func toTextView() -> Text {
        Text(self)
    }
}
