//
//  listView.swift
//  3rd_hw_ChoiSeungAh
//
//  Created by 최승아 on 3/30/25.
//

import SwiftUI

struct listView: View {
    
    var body: some View {
        
        List {
            
            Section {
                HStack {
                    Image("tooth")
                        .resizable()
                        .frame(width: 31, height: 35)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("치아는 뼈일까?")
                            .font(.system(size: 15))
                            .foregroundColor(Color(hex: "868F9A"))
                        Text("정답보기")
                            .font(.system(size: 18))
                            .foregroundColor(.blue)
                    } // VStack
                    Spacer()
                    Image("arrow.forward")
                        .resizable()
                        .frame(width: 7, height: 13)
                } // HStack
                .padding(.vertical, 12)
            } // Section
            
            Section {
                HStack {
                    Text("토스뱅크")
                        .font(.system(size: 17))
                        .foregroundColor(Color(hex: "525965"))
                    Spacer()
                    Text("내 소비복권 긁기")
                        .font(.system(size: 13))
                        .foregroundColor(.blue)
                    
                    Image("arrow.forward")
                        .resizable()
                        .frame(width: 7, height: 13)
                } // HStack
                .padding(.vertical, 11)
            } // Section
            
            Section {
                VStack {
                    ForEach(homeData.modeling[0], id: \.id) { item in
                        
                        DemoRow(data: item)
                            .listRowSeparator(.hidden)
                        
                    } // ForEach
                    .padding(.vertical, 8)
                    
                    Divider()
                    
                    HStack {
                        Text("대출 0")
                            .font(.system(size: 13))
                            .foregroundColor(Color(hex: "7C8590"))
                            .frame(maxWidth: .infinity, alignment: .center)
                        Image("Background")
                            .foregroundColor(Color(hex: "7C8590"))
                        Text("증권 7")
                            .font(.system(size: 13))
                            .foregroundColor(Color(hex: "7C8590"))
                            .frame(maxWidth: .infinity, alignment: .center)
                        Image("Background")
                            .foregroundColor(Color(hex: "7C8590"))
                        Text("저축 3")
                            .font(.system(size: 13))
                            .foregroundColor(Color(hex: "7C8590"))
                            .frame(maxWidth: .infinity, alignment: .center)
                        Image("Background")
                            .foregroundColor(Color(hex: "7C8590"))
                        Text("전체 26")
                            .font(.system(size: 13))
                            .foregroundColor(Color(hex: "7C8590"))
                            .frame(maxWidth: .infinity, alignment: .center)
                    } // HStack
                } // VStack
            } // Section
            
            Section {
                HStack {
                    ZStack {
                        Image("s4")
                            .resizable()
                            .frame(width: 34, height: 34)
                            .padding(.trailing, 10)
                            .overlay(
                                Text("W")
                                    .foregroundColor(Color(hex: "2E8CD9"))
                                    .font(.system(size: 20))
                                    .offset(x: -5, y: 0),
                                alignment: .center
                            )
                        
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("823,643원")
                            .font(.system(size: 18))
                            .foregroundColor(Color(hex: "3F4247"))
                        Text("3월에 쓴돈")
                            .font(.system(size: 13))
                            .foregroundColor(Color(hex: "848D99"))
                    } // VStack
                    Spacer()
                    Text("내역")
                        .foregroundColor(Color(hex: "737C88"))
                        .font(.system(size: 13))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color(hex: "F2F3F5"))
                        .cornerRadius(8)
                } // HStack
                .padding(.vertical, 12)
            } // Section
            
            Section {
                VStack {
                    HStack {
                        Image("s5")
                            .resizable()
                            .frame(width: 34, height: 34)
                            .padding(.trailing, 10)
                        Text("내 신용점수")
                            .font(.system(size: 15))
                            .foregroundColor(Color(hex: "55585B"))
                        Spacer()
                        Text("확인하기")
                            .foregroundColor(Color(hex: "737C88"))
                            .font(.system(size: 13))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color(hex: "F2F3F5"))
                            .cornerRadius(8)
                    } // HStack
                    .padding(.vertical, 12)
                    Divider()
                    HStack {
                        Text("계좌개설")
                            .font(.system(size: 15))
                            .foregroundColor(Color(hex: "6E7783"))
                            .frame(maxWidth: .infinity, alignment: .center)
                        Image("Background")
                            .foregroundColor(Color(hex: "7C8590"))
                        Text("카드발급")
                            .font(.system(size: 15))
                            .foregroundColor(Color(hex: "6E7783"))
                            .frame(maxWidth: .infinity, alignment: .center)
                        Image("Background")
                            .foregroundColor(Color(hex: "7C8590"))
                        Text("대출받기")
                            .font(.system(size: 15))
                            .foregroundColor(Color(hex: "6E7783"))
                            .frame(maxWidth: .infinity, alignment: .center)
                    } // HStack
                } // VStack
            } // Section
            
            Section {
                HStack {
                    Image("s6")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text("[7만원]이 지급되었습니다")
                            .font(.system(size: 17))
                            .foregroundColor(Color(hex: "525965"))
                            .padding(.vertical, 3)
                        Text("빗썸신규회원100%지급")
                            .font(.system(size: 15))
                            .foregroundColor(Color(hex: "828B97"))
                    } // VStack
                } // HStack
                .padding(.vertical, 12)
            } // Section
            
            Section(header: Text("최승아님을 위해 준비했어요")
                .font(.system(size: 17))
                .foregroundColor(Color(hex: "545C68")).listRowInsets(EdgeInsets(top: 12, leading: 5, bottom: 5, trailing: 0))) {
                    HStack(spacing: 10) {
                        // 첫 번째 카드
                        VStack {
                            HStack {
                                Text("혜택받는\n신용카드")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(hex: "5C6066"))
                                Spacer()
                                Image("card1")
                                    .resizable()
                                    .frame(width: 57, height: 58)
                            } // HStack
                            .padding(10)
                        } // Vstack
                        .background(Color.white)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                        
                        // 두 번째 카드
                        VStack {
                            HStack {
                                Text("내 카드보다\n혜택받기")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(hex: "5C6066"))
                                Spacer()
                                Image("card2")
                                    .resizable()
                                    .frame(width: 58, height: 57)
                            } // HStack
                            .padding(10)
                        } // VStack
                        .background(Color.white)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                    } // HStack
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowBackground(Color.clear)
                } // Section
            
            Section(
                footer: HStack(spacing: 100) {
                    Text("내 자산 숨기기")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "B0B7BF"))
                        .padding(.vertical, 30)
                    Text("금액 가리기")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "B0B7BF"))
                        .padding(.vertical, 30)
                }
                    .padding(.horizontal, 30)
            ) {
                ForEach(homeData.modeling[1], id: \.id) { item in
                    DemoRow2(data: item)
                        .listRowSeparator(.hidden)
                } // ForEach
                .padding(.vertical, 8)
                
            } // Section
            
        } // List
        .listStyle(InsetGroupedListStyle())
        .listSectionSpacing(11)
        .listRowSeparator(.hidden)
    }
}

#Preview {
    listView()
}
