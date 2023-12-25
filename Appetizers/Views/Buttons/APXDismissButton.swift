//
//  APXDismissButton.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 24.12.2023.
//

import SwiftUI

struct APXDismissButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .imageScale(.small)
            .tint(.black)
            .padding(6)
            .background(.white)
            .opacity(0.6)
            .clipShape(Circle())
            .padding()
            
    }
}

#Preview {
    APXDismissButton()
}
