//
//  OrderHistory.swift
//  House
//
//  Created by User on 5/24/22.
//

import Foundation

struct OrderHistory: Codable {
    var numbersOfOrder: Int = 0
    let furniture: Furniture
}

extension OrderHistory: Equatable {
    static func == (lhs: OrderHistory, rhs: OrderHistory) -> Bool {
        lhs.furniture.imageName == rhs.furniture.imageName
    }
}

