//
//  sendData.swift
//  4th_hw_ChoiSeungAh
//
//  Created by 최승아 on 4/6/25.
//

import SwiftUI

struct sendData: Identifiable {
    let id = UUID()
    var image: String
    var bank: String
    var bankName: String
}

extension sendData {
    static let model: [sendData] = [
        sendData(image: "send1", bank: "하나은행157-891652-62107", bankName: "WINGO통장"),
        sendData(image: "send2", bank: "삼성증권7112898902-01", bankName: "종합매매"),
        sendData(image: "send3", bank: "KB국민96314175848", bankName: "김정희"),
        sendData(image: "send4", bank: "카카오뱅크3333-20-8455642", bankName: "내입출금통장"),
        sendData(image: "send5", bank: "IBK기업286-104115-01-019", bankName: "김래언"),
        sendData(image: "send3", bank: "KB국민96314175848", bankName: "김정희"),
        sendData(image: "send4", bank: "카카오뱅크3333-20-8455642", bankName: "내입출금통장"),
        sendData(image: "send5", bank: "IBK기업286-104115-01-019", bankName: "김래언"),
    ]
}
