//
//  homeData.swift
//  3rd_hw_ChoiSeungAh
//
//  Created by 최승아 on 3/30/25.
//

import SwiftUI

struct homeData: Identifiable {
    let id = UUID()
    var bank: String
    var sum: String
    var name: String
}

extension homeData {
    static let modeling: [[homeData]] = [[
        homeData(bank: "1", sum: "339,690원", name: "WINGO통장"),  // 홈페이지 제일 긴 리스트 섹션
        homeData(bank: "2", sum: "38,841원", name: "토스뱅크통장"),
        homeData(bank: "3", sum: "114원", name: "토스뱅크에 쌓인 이자"),
        homeData(bank: "4", sum: "650원", name: "MY입출금통장"),
        homeData(bank: "5", sum: "2,090원", name: "KB나라사랑우대통장"),
        homeData(bank: "6", sum: "29원", name: "보통예금(BK나라사랑통장)"),
        homeData(bank: "7", sum: "118원", name: "토스뱅크외화통장 · 2개"),
        homeData(bank: "8", sum: "0원", name: "입출금통장"),
        homeData(bank: "9", sum: "1,051원", name: "보통예금(BK주거래생활금융통장)"),
        homeData(bank: "10", sum: "15,257,990원", name: "투자 모아보기 · 15개"),
    ],
                                         [   // 홈페이지 두번째로 긴 리스트 섹션
                                            homeData(bank: "l1", sum: "내현금영수증", name: ""),
                                            homeData(bank: "l2", sum: "토스신용카드", name: ""),
                                            homeData(bank: "l3", sum: "더 낸 연말정산 돌려받기", name: ""),
                                         ]
    ]
}
