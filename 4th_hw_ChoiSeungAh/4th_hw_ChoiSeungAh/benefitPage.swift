//
//  benefitPage.swift
//  3rd_hw_ChoiSeungAh
//
//  Created by 최승아 on 3/30/25.
//

import SwiftUI

struct benefitPage: View {
    var body: some View {
        Text("혜택 페이지")
        .tabItem{
            Image(systemName: "diamond.fill")
            Text("혜택")
        }
        .tag(1)
    }
}

#Preview {
    benefitPage()
}
