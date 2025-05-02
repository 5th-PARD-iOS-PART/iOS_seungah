//
//  DemoRow4.swift
//  4th_hw_ChoiSeungAh
//
//  Created by 최승아 on 4/6/25.
//

import SwiftUI

struct DemoRow4: View {
    var data: sendData
    
    var body: some View {
        VStack {
            HStack {
                Image(data.image)
                    .resizable()
                    .frame(width: 45, height: 45)
                    .padding(.vertical, 5)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading) {
                    Text(data.bank)
                        .font(.system(size: 18))
                        .padding(.vertical, 1)
                        .foregroundColor(Color(hex: "525A66"))
                    Text(data.bankName)
                        .font(.system(size: 16))
                        .padding(.vertical, 1)
                        .foregroundColor(Color(hex: "8E96A1"))
                } // VStack
                Spacer()
                
                if data.image == "send1" || data.image == "send2" {
                    Image(systemName: "star.fill")
                        .frame(width: 25, height: 23)
                        .foregroundColor(.blue)
                } else {
                    Image(systemName: "star.fill")
                        .frame(width: 25, height: 23)
                        .foregroundColor(Color(hex: "D1D6DB"))
                }
            } // HStack
        } // VStack
    }
}
