//
//  AppetizerDetailCard.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 24.12.2023.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer
    
    var body: some View {
        VStack(spacing: 16) {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.medium)
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding()
            HStack(spacing: 70) {
                NutritionVStack(title: "Calories", value: appetizer.calories.toString())
                NutritionVStack(title: "Carbs", value: "\(appetizer.carbs) g")
                NutritionVStack(title: "Protein", value: "\(appetizer.protein) g")
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: .infinity,height: 60)
                        .padding()
                    .tint(.brandPrimary)
                    Text("\(appetizer.price.formatted(.currency(code: "USD"))) - Add To Order")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.background)
                }
            })
        }
        .overlay(alignment: .topTrailing) {
            Button {
                
            }label: {
                Image(systemName: "xmark")
                    .tint(.primary)
                    .padding(8)
                    .background(.white)
                    .opacity(0.6)
                    .clipShape(Circle())
                    .padding()
                    
            }
        }
    }
    
    struct NutritionVStack: View {
        let title: String
        let value: String
        var body: some View {
            VStack{
                Text(title)
                    .font(.subheadline)
                Text(value)
                    .italic()
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer)
}


