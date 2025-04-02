//
//  bankData.swift
//  3rd_hw_ChoiSeungAh
//
//  Created by 최승아 on 4/2/25.
//

import SwiftUI

struct bankData: Identifiable {    // 상세페이지 데이터
    let id = UUID()
    var item: String
    var title: String
    var time: String
    var money: String
    var total: String
}

extension bankData {
    static let modeling: [[bankData]] = [[
        bankData(item: "taxi", title: "카카오 택시_0", time: "11:13", money: "-6,200원", total: "38,841원"),
        bankData(item: "taxi", title: "카카오 택시 선승인", time: "11:00", money: "+6,900원", total: "45,041원"),
        bankData(item: "taxi", title: "카카오 택시 선승인", time: "11:00", money: "-6,900원", total: "38,141원"),
        
    ],
                                         [
                                            bankData(item: "game", title: "플렉스PC방", time: "22:44", money: "-5,500원", total: "45,041원"),
                                            bankData(item: "game", title: "플렉스PC방", time: "21:35", money: "-5,000원", total: "50,541원"),
                                            bankData(item: "cu", title: "씨유한동대오석관점", time: "16:17", money: "-2,000원", total: "55,541원"),
                                            bankData(item: "cu", title: "씨유한동대오석관점", time: "15:59", money: "-4,400원", total: "57,541원"),
                                            bankData(item: "taxi", title: "카카오 택시_0", time: "10:00", money: "-7,000원", total: "61,941원"),
                                            bankData(item: "taxi", title: "카카오 택시 선승인", time: "09:47", money: "+7,300원", total: "68,941원"),
                                            bankData(item: "taxi", title: "카카오 택시 선승인", time: "09:47", money: "-7,300원", total: "61,641원"),
                                            bankData(item: "taxi", title: "카카오 택시 선승인", time: "09:46", money: "+7,300원", total: "68,941원"),
                                            bankData(item: "taxi", title: "카카오 택시 선승인", time: "09:46", money: "-7,300원", total: "61,641원"),
                                         ]
    ]
}
