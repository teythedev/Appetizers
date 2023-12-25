//
//  AppetizerDetailCard.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 24.12.2023.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer
    
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack() {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .frame(width: 300, height: 225)
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: appetizer.calories.toString())
                    NutritionInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionInfo(title: "Protein", value: "\(appetizer.protein) g")
                }
            }
            Spacer()
            Button(action: {
                print("Button Tapped")
            }, label: {
                APButton(title: "\(appetizer.price.formatted(.currency(code: "USD"))) - Add To Order")
            })
            .padding(.bottom,30)
        }
        .frame(width: 300,height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                withAnimation(.bouncy) {
                    isShowingDetail = false
                }
                
            }label: {
               APXDismissButton()
            }
        }
    }
    
    struct NutritionInfo: View {
        let title: String
        let value: String
        var body: some View {
            VStack(spacing: 5) {
                Text(title)
                    .fontWeight(.bold)
                    .font(.caption)
                Text(value)
                    .italic()
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizerOne,isShowingDetail: .constant(true))
}


