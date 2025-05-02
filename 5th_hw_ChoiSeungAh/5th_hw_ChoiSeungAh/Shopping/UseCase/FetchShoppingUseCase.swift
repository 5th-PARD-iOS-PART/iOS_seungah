//
//  FetchShoppingUseCase.swift
//  5th_hw_ChoiSeungAh
//
//  Created by 최승아 on 5/2/25.
//

import Foundation

// UseCase 프로토콜
// 특정 비즈니스 로직이나 작업을 캡슐화
protocol FetchShoppingUseCase {
    func execute(category: ShoppingTab) -> [ShoppingModel]
    func executeSortedByPrice(category: ShoppingTab) -> [ShoppingModel]
    func getSpecialItemAndSortedItems(items: [ShoppingModel]) -> (specialItem: (model: ShoppingModel, index: Int)?, sortedItems: [(model: ShoppingModel, index: Int)])
}
