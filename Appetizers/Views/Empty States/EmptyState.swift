//
//  EmptyState.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 24.12.2023.
//

import SwiftUI

struct EmptyState: View {
    let imageResource: ImageResource
    let message: String
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                Image(imageResource)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyState(imageResource: .emptyOrder, message: "This is a test message.\nIt should be a little bit long to test how it's work")
}
