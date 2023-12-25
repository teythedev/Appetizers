//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 23.12.2023.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    
    @Published
    var appetizers: [Appetizer] = []
    
    @Published
    var alertItem: AlertItem?
    
    @Published
    var isLoading: Bool = false
    
    func getAppetizers() async {
        isLoading.toggle()
        let result = await NetworkManager.shared.getAppetizers()
        isLoading.toggle()
        switch result {
        case .success(let appetizers):
            self.appetizers = appetizers
        case .failure(let error):
            switch error {
            case .invalidURL:
                alertItem = AlertContext.invalidURL
            case .invalidResponse:
                alertItem = AlertContext.invalidResponse
            case .invalidData:
                alertItem = AlertContext.invalidData
            case .unableToComplete:
                alertItem = AlertContext.unableToComplete
            }
        }
    }
}
