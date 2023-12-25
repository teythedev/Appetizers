//
//  AccountView.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 22.12.2023.
//

import SwiftUI

struct AccountView: View {
    @StateObject
    private var viewModel = AccountViewModel()

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    Button{
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                } header: {
                    Text("Personal Info")
                }
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                        
                    Toggle("Frequent Refill", isOn: $viewModel.user.frequentRefill)
                       
                }header: {
                    Text("Request")
                }
                
            }
            .tint(.brandPrimary)
            .navigationTitle("🤦🏻‍♂️ Account")
            
        }
        .onAppear{
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
