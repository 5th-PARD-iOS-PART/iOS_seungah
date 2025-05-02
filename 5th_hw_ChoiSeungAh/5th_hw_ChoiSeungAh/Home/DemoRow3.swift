//
//  DemoRow3.swift
//  3rd_hw_ChoiSeungAh
//
//  Created by 최승아 on 4/2/25.
//

import SwiftUI

struct DemoRow3: View {
    var data: bankData
    
    var body: some View {
        HStack {
            Image(data.item)
                .resizable()
                .frame(width: 45, height: 45)
                .padding(.vertical, 5)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(data.title)
                    .font(.system(size: 18))
                    .padding(.vertical, 1)
                    .foregroundColor(Color(hex: "737A84"))
                Text(data.time)
                    .font(.system(size: 13))
                    .padding(.vertical, 1)
                    .foregroundColor(Color(hex: "848D99"))
            } // VStack
            Spacer()
            VStack(alignment: .trailing) {
                if data.money == "+6,900원" || data.money == "+7,300원" || data.money == "+7,300원" {
                    Text(data.money)
                        .font(.system(size: 18))
                        .padding(.vertical, 1)
                        .foregroundColor(Color(hex: "69A4F8"))
                } else {
                    Text(data.money)
                        .font(.system(size: 18))
                        .padding(.vertical, 1)
                        .foregroundColor(Color(hex: "78808C"))
                }
                Text(data.total)
                    .font(.system(size: 13))
                    .padding(.vertical, 1)
                    .foregroundColor(Color(hex: "A7AEB6"))
                    
            } // VStack
        } // HStack
        .padding(.vertical, 2)
    }
}
