//
//  checkSendPage.swift
//  4th_hw_ChoiSeungAh
//
//  Created by 최승아 on 4/7/25.
//

import SwiftUI

struct checkSendPage: View {
    let amount: Int
    var selectedData: sendData
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("\(selectedData.bankName)")
                    .font(.system(size: 29, weight: .semibold))
                    .foregroundColor(Color(hex: "1A94FF"))
                    .padding(.top, 150)
                Text("으로")
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(Color(hex: "343D46"))
                    .padding(.top, 150)
            } // HStack
            
            Text("\(amount.formatted())원을")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(Color(hex: "374049"))
            Text("옮길까요?")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(Color(hex: "374049"))
            
            
            Spacer()
            HStack {
                Text("받는 분에게 표시")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color(hex: "9BA7B3"))
                Spacer()
                Text("최승아")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color(hex: "9BA7B3"))
                Image(systemName: "chevron.right")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color(hex: "9BA7B3"))
            } // HStack
            .padding(.vertical, 12)
            
            HStack {
                Text("출금계좌")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color(hex: "9BA7B3"))
                Spacer()
                Text("내 토스뱅크 통장")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color(hex: "9BA7B3"))
                Image(systemName: "chevron.right")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color(hex: "9BA7B3"))
            } // HStack
            .padding(.vertical, 12)
            
            HStack {
                Text("입금계좌")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color(hex: "9BA7B3"))
                Spacer()
                Text("\(selectedData.bank)")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(Color(hex: "6C7B89"))
            } // HStack
            .padding(.vertical, 10)
            .padding(.bottom, 40)
            
            Button(action: {
                path = NavigationPath()
            }) {
                Text("옮기기")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color(hex: "C7E5FF"))
                    .frame(width: 360, height: 63)
                    .background(Color(hex: "0087FF"))
                    .cornerRadius(18)
            } // Button
            
            
            Text("평생수수료 무료")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(Color(hex: "8C99A5"))
        } // VStack
        .padding(.horizontal, 25)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: HStack {
            Button(action: {
                path.removeLast()
            }) {
                Image(systemName: "chevron.left")
                    .frame(width: 12, height: 21)
                    .foregroundColor(.black)
            }
            Text("토스뱅크송금")
                .font(.system(size: 18))
                .foregroundColor(Color(hex: "606772"))
                .padding(.horizontal, 100)
        })
    }
}
