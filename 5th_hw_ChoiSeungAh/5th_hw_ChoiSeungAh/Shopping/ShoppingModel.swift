//
//  ShoppingModel.swift
//  5th_hw_ChoiSeungAh
//
//  Created by 최승아 on 5/2/25.
//

import Foundation

enum ShoppingTab: String, CaseIterable, Identifiable {
    case all = "모두"
    case special = "특가"
    case food = "식품"
    case clothes = "의류"
    case electronics = "전자기기"
    case beauty = "뷰티"
    
    var id: Self { self }
}


struct ShoppingModel: Identifiable {
    let id = UUID()
    let image: [String]
    let title: [String]
    let salePrice: [String]
    let originalPrice: [String]
    let watching: [String]
    let category: ShoppingTab
    
    // 문자열 가격 → Int로 변환
    var salePriceInt: [Int] {
        return salePrice.map { price in
            Int(price.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)) ?? 0
        }
    }
    
}
