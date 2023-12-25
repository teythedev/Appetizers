//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 24.12.2023.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user")
    private var userData: Data?
    
    @Published
    var user: User = User()
    
    @Published
    var alertItem: AlertItem?
    
    func saveChanges() {
        guard isValidForm else {return}
        do {
            let encoder = JSONEncoder()
            let encodedUserData = try encoder.encode(user)
            userData = encodedUserData
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData = userData else {
            return
        }
        do {
            let decoder = JSONDecoder()
            user = try decoder.decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    

}
