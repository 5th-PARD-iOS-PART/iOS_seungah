//
//  wholePage.swift
//  3rd_hw_ChoiSeungAh
//
//  Created by 최승아 on 3/30/25.
//

import SwiftUI

struct wholePage: View {
    var body: some View {
        Text("전체 페이지")
        .tabItem{
            Image(systemName: "bag.fill")
            Text("전체")
        }
        .tag(5)
    }
}

#Preview {
    wholePage()
}
