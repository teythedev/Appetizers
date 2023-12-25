//
//  Double+ext.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 25.12.2023.
//

//appetizer.price.formatted(.currency(code: "TRY"))

import Foundation
extension Double {
    func convertCurrency(currencyCode: String) -> String {
        self.formatted(.currency(code: currencyCode))
    }
}
