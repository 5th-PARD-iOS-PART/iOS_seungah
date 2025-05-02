//
//  ShoppingRepository.swift
//  5th_hw_ChoiSeungAh
//
//  Created by 최승아 on 5/2/25.
//

import Foundation

// Repository 프로토콜
// 데이터 소스(API, 데이터베이스 등)와의 통신
protocol ShoppingRepository {
    func fetchShopping(category: ShoppingTab) -> [ShoppingModel]
}
