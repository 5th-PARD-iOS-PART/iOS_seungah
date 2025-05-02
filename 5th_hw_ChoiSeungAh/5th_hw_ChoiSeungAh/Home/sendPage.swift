//
//  sendPage.swift
//  4th_hw_ChoiSeungAh
//
//  Created by 최승아 on 4/5/25.
//

import SwiftUI

struct sendPage: View {
    let priceList = ["계좌", "연락처"]
    @Namespace private var toggleAnimation  // 토글 애니메이션
    @State private var selectedIndex = 0    // 토글버튼의 현재 선택된 위치
    @State private var name: String = ""
    @State private var selectedItem: sendData? = nil // 선택된 항목의 데이터
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("어디로 돈을 보낼까요?")
                .font(.system(size: 26))
                .fontWeight(.semibold)
                .foregroundColor(Color(hex: "3A3F46"))
                .padding(.vertical, 10)
                .padding(.bottom, 5)
            // Toggle between account and contacts
            ZStack {
                HStack(spacing: 0) {
                    ForEach(priceList.indices, id: \.self) { index in
                        ToggleAnimationView(selectedIndex == index, content: Text(priceList[index])
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .frame(height: 51)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(selectedIndex == index ? Color(hex: "6B727C"): Color(hex: "868F9B"))
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    selectedIndex = index
                                }
                            }
                        ) // ToggleAnimationView
                    } // ForEach
                } // HStack
            } // ZStack
            .padding(4)
            .frame(height: 55)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.white, lineWidth: 1)
                    .background(Color(hex: "F2F3F5"))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            ) // background
            .padding(.bottom, 25)
            
            ScrollView {
                HStack {
                    TextField("계좌번호입력", text: $name)
                        .font(.system(size: 23))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hex: "9EA6B0"))
                        .padding(.vertical, 10)
                    
                    // 오른쪽에 카메라 아이콘 버튼
                    Button(action: {
                        // 카메라 버튼 액션 구현
                    }) {
                        Image(systemName: "camera.fill")
                            .foregroundColor(Color(hex: "6B727C"))
                            .frame(width: 24, height: 24)
                    } // Button
                } // HStack
                .padding(.horizontal, 8)
                .overlay(
                    VStack {
                        Spacer()
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color(hex: "DADDE1"))
                    } // VStack
                ) // overlay
                HStack {
                    Text("내 계좌")
                        .font(.system(size: 17))
                        .foregroundColor(Color(hex: "4B4F56"))
                        .padding(.top, 5)
                    Spacer()
                    Text("+18개")
                        .font(.system(size: 15))
                        .foregroundColor(Color(hex: "89929D"))
                    Image(systemName: "chevron.right")
                        .frame(width: 7, height: 13)
                } // HStack
                .padding(.vertical, 15)
                VStack(alignment: .leading) {
                    ForEach(sendData.model.prefix(2)) { item in
                        Button(action: {
                            path.append(SendDestination(data: item))
                        }) {
                            DemoRow4(data: item)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.vertical, 10)
                    
                    Text("최근 보낸 계좌")
                        .font(.system(size: 17))
                        .padding(.vertical, 15)
                        .padding(.top, 25)
                    
                    ForEach(sendData.model.dropFirst(2)) { item in
                        Button(action: {
                            path.append(SendDestination(data: item))
                        }) {
                            DemoRow4(data: item)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.vertical, 10)
                } // VStack
            } // ScrollView
        } // VStack
        .padding(.horizontal, 27)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            path.removeLast()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .frame(width: 12, height: 21)
            } // HStack
            .foregroundColor(.black)
        })
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder func ToggleAnimationView<Content: View>(_ isActive: Bool, content: Content) -> some View {
        if isActive {   // 활성화된 토글에 흰색 배경과 애니메이션 적용
            content
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.white)
                        .padding(6)
                        .matchedGeometryEffect(id: "highlightitem", in: toggleAnimation)
                )
        } else {
            content
        }
    }
}

// 송금 대상 데이터를 네비게이션에서 관리
struct SendDestination: Hashable {
    let data: sendData
    
    // 네비게이션 경로에서 식별하기 위함
    func hash(into hasher: inout Hasher) {
        hasher.combine(data.id)
    }
    
    // 두 SendDestination이 동일한지 비교
    static func == (lhs: SendDestination, rhs: SendDestination) -> Bool {
        return lhs.data.id == rhs.data.id
    }
}
