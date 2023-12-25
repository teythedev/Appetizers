//
//  APButton.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 24.12.2023.
//

import SwiftUI

struct APButton: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.background)
            .frame(width: 260,height: 50)
            .background(.brandPrimary)
            .clipShape(RoundedRectangle(cornerRadius: 10))

    }
}

#Preview {
    APButton(title: "Test title")
}
