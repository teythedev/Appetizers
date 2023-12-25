//
//  APError.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 23.12.2023.
//

import Foundation
enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

enum APFormError: Error {
    case invalidEmail
    case invalidForm
}
