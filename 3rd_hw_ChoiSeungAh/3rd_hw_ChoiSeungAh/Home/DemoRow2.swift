//
//  DemoRow2.swift
//  3rd_hw_ChoiSeungAh
//
//  Created by 최승아 on 3/30/25.
//

import SwiftUI

struct DemoRow2: View {
    var data: homeData
    
    var body: some View {
        HStack {    // 홈페이지 두번째로 긴 리스트 섹션
            Image(data.bank)
                .resizable()
                .frame(width: 21, height: 24)
                .padding(.vertical, 5)
                .padding(.trailing, 6)
            
            VStack(alignment: .leading) {
                Text(data.sum)
                    .font(.system(size: 18))
                    .foregroundColor(Color(hex: "43464C"))
            } // VStack
            Spacer()
            Image("arrow.forward")
                .resizable()
                .frame(width: 8, height: 13)
        } // HStack
    }
}
