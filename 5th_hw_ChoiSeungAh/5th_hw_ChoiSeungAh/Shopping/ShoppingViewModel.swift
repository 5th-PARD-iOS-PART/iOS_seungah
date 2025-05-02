//
//  ShoppingViewModel.swift
//  5th_hw_ChoiSeungAh
//
//  Created by 최승아 on 5/2/25.
//

import Foundation
import Observation
import SwiftUICore

@Observable
final class ShoppingViewModel {
    var Items: [ShoppingModel] = []
    var selectedCategory: ShoppingTab = .all // 사용자가 탭을 누르기 전 초기 상태
    var specialItem: (model: ShoppingModel, index: Int)? // 특가 상품
    var sortedItems: [(model: ShoppingModel, index: Int)] = [] // 상품 정렬
    
    private let fetchShoppingUseCase: FetchShoppingUseCase
    
    init(fetchShoppingUseCase: FetchShoppingUseCase) {
        self.fetchShoppingUseCase = fetchShoppingUseCase
    }
    
    func fetchItems() {
        if selectedCategory == .all {
            return self.Items = fetchShoppingUseCase.executeSortedByPrice(category: selectedCategory) // 전체 아이템을 낮은 가격 순으로 가져옴
        } else {
            return self.Items = fetchShoppingUseCase.execute(category: selectedCategory) // 선택된 카테고리에 해당하는 아이템만 가져옴
        }
    }
    
    func processItems() {
        let result = fetchShoppingUseCase.getSpecialItemAndSortedItems(items: Items)
        self.specialItem = result.specialItem
        self.sortedItems = result.sortedItems
    } // .all 카테고리 아이템 정렬
    
}


// ViewModel은 View에게 데이터를 제공하는 로직!(View에서 쓸 로직만)
