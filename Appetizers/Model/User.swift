//
//  User.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 24.12.2023.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthdate: Date = Date()
    var extraNapkins: Bool = false
    var frequentRefill: Bool = false
    
}
