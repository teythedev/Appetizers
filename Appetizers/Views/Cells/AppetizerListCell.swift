//
//  AppetizerItemView.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 23.12.2023.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    var body: some View {
        HStack{
//            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 120,height: 90)
//                    .clipShape(RoundedRectangle(cornerRadius: 8))
//            } placeholder: {
//                ZStack {
//                    Image(.foodPlaceholder)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 120,height: 90)
//                        .clipShape(RoundedRectangle(cornerRadius: 8))
//                    ProgressView()
//                        .tint(.brandPrimary)
//                        .frame(width: 120,height: 90)
//                }
//            }

            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 120,height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.leading, 8)
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text(appetizer.price.convertCurrency(currencyCode: "USD"))
                    .font(.title3)
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            Spacer()
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizerOne)
}
