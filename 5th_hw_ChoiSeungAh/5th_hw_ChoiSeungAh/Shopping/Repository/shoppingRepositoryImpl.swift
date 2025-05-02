//
//  ShoppingRepositoryImpl.swift
//  5th_hw_ChoiSeungAh
//
//  Created by 최승아 on 5/2/25.
//

import Foundation

// Repository 구현체
final class ShoppingRepositoryImpl : ShoppingRepository {
    
    // 서버의 데이터 저장소 역할(서버 대신 임시로 사용할 배열임)
    private var products: [ShoppingModel] = []
    
    // 생성자에서 기본 MockData 세팅
    init() {
        products = [
            
            // special 카테고리
            ShoppingModel(
                image: ["all2", "all4"],
                title: ["[단독구매불가] 압도적 당도 체스프리 루비레드키위 & 골드키위사 ...", "[오늘만]스파클생수 500mL*60병/2L*24병",],
                salePrice: ["2,900원", "9,900원"],
                originalPrice: ["5,900원", "18,000원"],
                watching: ["44.6만명이구경함·무료배송", "54.9만명이구경함·무료배송"],
                category: .special
            ),
            
            // food 카테고리
            ShoppingModel(
                image: ["all3", "all5"],
                title: ["[보틀/파우치증정] 프로티원 단백질 쉐이크 6종 × 2통 (곡물,딸기..", "[최초공개]한정수량 신품종 레몬 캔디 스테비아 방울토마토"],
                salePrice: ["35,900원", "6,990원"],
                originalPrice: ["79,800원", "12,000원"],
                watching: ["93.3만명이구경함·무료배송", "52.1만명이 구경함·무료배송"],
                category: .food
            ),
            
            // clothes 카테고리
            ShoppingModel(
                image: ["clothes2", "clothes3"],
                title: ["여름 베이직 테일러드 자켓", "[자체제작] 핀턱 트레이닝 버뮤다 하프 팬츠 카고 합포 ..."],
                salePrice: ["36,900원", "17,900원"],
                originalPrice: ["228,000원", "39,800원"],
                watching: ["73.4만명이 구경함·무료배송", "16.5만명이 구경함·무료배송"],
                category: .clothes
            ),
            
            // electronics 카테고리
            ShoppingModel(
                image: ["electronics1"],
                title: ["쿠쿠 스탠드형 리모컨 14인치(35cm) 서큘레이터 ..."],
                salePrice: ["239,000원"],
                originalPrice: ["245,000원"],
                watching: ["32.9만명이 구경함·무료배송"],
                category: .electronics
            ),
            
            // beauty 카테고리
            ShoppingModel(
                image: ["all6", "beauty1", "beauty2", "beauty3"],
                title: ["[단 하루 혜택/사은품] 참존 베스트 오일세럼 4종 토스 단독구성/...", "센텔리안24 엑스퍼트 마데카 멜라캡처 앰플 맥스 ...", "[딥디크] 오 로즈 오 드 뚜왈렛", "[1+1] 코리아나 닥터가드 탈모완화 샴푸 +(증정) ..."],
                salePrice: ["12,900원", "19,900원", "115,000원", "39,000원"],
                originalPrice: ["40,000원", "75,000원", "183,000원", "64,000원"],
                watching: ["64.2만명이 구경함·무료배송", "44.7만명이 구경함·무료배송", "21.0만명이 구경함·무료배송", "28.9만명이 구경함·무료배송"],
                category: .beauty
            )
            
        ] // products
    }
    
    func fetchShopping(category: ShoppingTab) -> [ShoppingModel] {
        if category == .all {
            return products
        } else {
            return products.filter { product in // product라는 매개변수 선언
                product.category == category
            } // products 배열에서 각 product의 category가 내가 넘겨준 category랑 같을 때 ($0.category == category랑 같은 의미)
        }
    }
}
