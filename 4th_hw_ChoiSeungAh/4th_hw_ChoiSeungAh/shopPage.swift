//
//  shopPage.swift
//  3rd_hw_ChoiSeungAh
//
//  Created by 최승아 on 3/30/25.
//

import SwiftUI

struct shopPage: View {
    var body: some View {
        Text("토스쇼핑 페이지")
        .tabItem{
            Image(systemName: "bag.fill")
            Text("토스쇼핑")
        }
        .tag(2)
    }
}

#Preview {
    shopPage()
}
