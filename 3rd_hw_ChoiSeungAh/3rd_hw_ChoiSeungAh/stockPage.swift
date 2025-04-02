//
//  stockPage.swift
//  3rd_hw_ChoiSeungAh
//
//  Created by 최승아 on 3/30/25.
//

import SwiftUI

struct stockPage: View {
    var body: some View {
        Text("증권 페이지")
        .tabItem{
            Image(systemName: "bag.fill")
            Text("증권")
        }
        .tag(4)
    }
}

#Preview {
    stockPage()
}
