//
//  FetchShoppingUseCaseImpl.swift
//  5th_hw_ChoiSeungAh
//
//  Created by 최승아 on 5/2/25.
//

import Foundation

// UseCase 구현체
final class FetchShoppingUseCaseImpl: FetchShoppingUseCase {
    private let repository: ShoppingRepository
    
    // 클래스를 생성할 때, 외부에서 repository를 주입하는 초기화 함수
    init(repository: ShoppingRepository) {
        self.repository = repository
    }
    
    // 내부에서 repository.fetchShopping(category: category)를 호출하고, 그 결과를 [ShoppingModel]에 저장
    func execute(category: ShoppingTab) -> [ShoppingModel] {
        return repository.fetchShopping(category: category)
    }
    
    // 가격이 낮은 순서대로 정렬
    func executeSortedByPrice(category: ShoppingTab) -> [ShoppingModel] {
        let items = repository.fetchShopping(category: category)
        return items.sorted {
            ($0.salePriceInt.min() ?? 0) < ($1.salePriceInt.min() ?? 0)
        }
    }
    
    func getSpecialItemAndSortedItems(items: [ShoppingModel]) -> (specialItem: (model: ShoppingModel, index: Int)?, sortedItems: [(model: ShoppingModel, index: Int)]) {
        // 특가 아이템 중 첫 번째 아이템 찾기
        var specialItem: (model: ShoppingModel, index: Int)? = nil
        for item in items where item.category == .special {
            if let firstIndex = item.title.indices.first {
                specialItem = (item, firstIndex)
                break
            }
        }
        
        // 모든 아이템을 가격 순으로 정렬 (카테고리 상관없이)
        var allItems: [(model: ShoppingModel, index: Int, price: Int)] = []
        
        for model in items {
            for (index, price) in model.salePriceInt.enumerated() {
                // 특가 아이템으로 선정된 아이템은 제외
                if let special = specialItem,
                   model.id == special.model.id &&
                    index == special.index {
                    continue
                }
                
                // 인덱스가 유효한지 확인
                if index < model.title.count &&
                    index < model.image.count &&
                    index < model.originalPrice.count &&
                    index < model.watching.count {
                    allItems.append((model: model, index: index, price: price))
                }
            }
        }
        
        // 가격 오름차순으로 정렬
        allItems.sort { $0.price < $1.price }
        
        // 정렬 결과 저장
        let sortedItems = allItems.map { ($0.model, $0.index) }
        
        return (specialItem, sortedItems)
    }
}




// 비즈니스 로직 계층
// ViewModel이나 다른 계층이 Repository에 직접 접근하지 않도록 중간에서 기능을 대신 실행해준다

// 예시로 뷰모델에서 let useCase = FetchShoppingUseCaseImpl(repository: ShoppingRepositoryImpl())] / let result = useCase.execute(category: .food)
//   1. execute(category: .food) 호출 → UseCase 실행
//   2. 내부적으로 repository.fetchShopping(category: .food) 호출
//   3. ShoppingRepositoryImpl 안의 products.filter 실행
//   4. .food인 상품들만 필터링해서 반환됨
