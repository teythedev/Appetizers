//
//  Appetizer.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 22.12.2023.
//

import Foundation
struct Appetizer: Decodable , Identifiable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}


struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001, 
                                           name: "Test Appetizer",
                                           description: "This is the description for my appetizer. it's yummy",
                                           price: 9.99,
                                           imageURL: "https://img.freepik.com/free-photo/side-view-shawarma-with-fried-potatoes-board-cookware_176474-3215.jpg?w=1060&t=st=1703333095~exp=1703333695~hmac=9020ec5bb733c7ceb79a10408baa8dfd296b1a8f67368036746a6089fcbb2789",
                                           calories: 99,
                                           protein: 9,
                                           carbs: 32)
    
    static let appetizers: [Appetizer] = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
}
