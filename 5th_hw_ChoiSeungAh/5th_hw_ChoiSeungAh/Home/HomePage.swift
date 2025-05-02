//
//  HomePage.swift
//  3rd_hw_ChoiSeungAh
//
//  Created by 최승아 on 3/30/25.
//

import SwiftUI

struct HomePage: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: -15) {
                HStack {
                    Image("할일")
                        .padding(.trailing, 12)
                    Text("할 일")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "637893"))
                        .padding(.trailing, 10)
                    Image("arrow1")
                        .foregroundColor(Color(hex: "B8C1D0"))
                    Spacer()
                    Image("결제")
                        .padding(.trailing, 12)
                    ZStack {
                        Image("알림")
                            .frame(width: 22, height: 25)
                            .overlay(
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size: 8))
                                    .offset(x: 8, y: -8),
                                alignment: .topTrailing
                            )
                    } // ZStack
                } // HStack
                .padding(25)
                
                listView(path: $path)
                    .frame(maxWidth: .infinity) // listView가 최대 너비를 차지하도록 설정
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                
            } // VStack
            .navigationDestination(for: String.self) { route in
                switch route {
                case "detail":
                    detailPage(path: $path)
                        .toolbar(.hidden, for: .tabBar) // 화면 상에서 바텀탭뷰 숨기기
                case "send":
                    sendPage(path: $path)
                        .toolbar(.hidden, for: .tabBar)
                default:
                    Text("Unknown destination")
                }
            }
            .navigationDestination(for: SendDestination.self) { destination in
                sendMoneyPage(selectedData: destination.data, path: $path)
                    .toolbar(.hidden, for: .tabBar)
            }
            .navigationDestination(for: CheckSendDestination.self) { destination in
                checkSendPage(amount: destination.amount, selectedData: destination.data, path: $path)
                    .toolbar(.hidden, for: .tabBar)
            }
            .background(Color(hex: "F2F4F6"))
        } // NavigationStack
        .tabItem{
            Image(systemName: "house.fill")
            Text("홈")
        }
        .tag(0)
    }
}

#Preview {
    HomePage()
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b, a) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17, 255)
        case 6: // RGB (24-bit)
            (r, g, b, a) = (int >> 16, int >> 8 & 0xFF, int & 0xFF, 255)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b, a) = (0, 0, 0, 255)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
