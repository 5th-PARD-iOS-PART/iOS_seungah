//
//  detailPage.swift
//  3rd_hw_ChoiSeungAh
//
//  Created by 최승아 on 3/31/25.
//

import SwiftUI

enum tapInfo : String, CaseIterable {
    case bankbook = "통장"
    case mybank = "내 토스뱅크"
    case search = "상품찾기"
}

struct detailPage: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedPicker: tapInfo = .bankbook
    @Namespace private var animation
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            animate().padding(.horizontal, 28)
            testView(tests: selectedPicker, path: $path)
            
        }
        .navigationBarBackButtonHidden(true)
        // 백버튼 색상을 설정할 수 없기 때문에 기본 백버튼은 숨기고 커스텀 버튼을 출력하기
        .navigationBarItems(leading: customBackButton)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("통장관리")
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: "727983"))
            }
        }
    }
    // 커스텀 백 버튼
    var customBackButton: some View {
        Button(action: {
            path.removeLast()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .frame(width: 12, height: 21)
            }
            .foregroundColor(.black)
        }
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(tapInfo.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .font(.system(size: 18))
                        .frame(maxWidth: .infinity/4, minHeight: 50)
                        .foregroundColor(selectedPicker == item ? .black : Color(hex: "6D747E"))
                    
                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(Color(hex: "6D747E"))
                            .frame(width: 110, height: 2)
                            .matchedGeometryEffect(id: "bankbook", in: animation)
                    }
                    
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }
    }
}

struct testView : View {
    var tests : tapInfo
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            switch tests {
            case .bankbook:
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("토스뱅크1000-9047-0710")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "8A919B"))
                                .padding(.vertical, 4)
                            HStack {
                                Text("38,841원")
                                    .font(.system(size: 29))
                                    .foregroundColor(Color(hex: "545D68"))
                                Spacer(minLength: 100)
                                HStack {
                                    Image(systemName: "lanyardcard.fill")
                                        .foregroundColor(Color(hex: "2B2B2B"))
                                        .frame(width: 12, height: 16)
                                    Text("카드")
                                        .font(.system(size: 13))
                                        .foregroundColor(Color(hex: "9097A1"))
                                } // HStack
                                .padding(.horizontal, 18)
                                .padding(.vertical, 12)
                                .background(Color(hex: "F2F4F6"))
                                .cornerRadius(22)
                            } // HStack
                            
                            
                        } // VStack
                        .padding(.top, 90)
                        .padding(.bottom, 20)
                        
                        
                        HStack {
                            
                            HStack {
                                Text("채우기")
                                    .font(.system(size: 18))
                                    .foregroundColor(Color(hex: "5F99F1"))
                            } // HStack
                            .padding(.horizontal, 60)
                            .padding(.vertical, 14)
                            .background(Color(hex: "E8F2FF"))
                            .cornerRadius(12)
                            
                            
                            Button(action: {path.append("send")} ) {
                                HStack {
                                    Text("보내기")
                                        .font(.system(size: 18))
                                        .foregroundColor(Color(hex: "C5DBFC"))
                                } // HStack
                                .padding(.horizontal, 60)
                                .padding(.vertical, 14)
                                .background(Color(hex: "3182F6"))
                                .cornerRadius(12)
                                
                                
                            } // HStack
                        }
                        
                        HStack {
                            Image("bolt")
                                .resizable()
                                .frame(width: 46, height: 46)
                                .padding(.trailing, 10)
                            
                            VStack(alignment: .leading) {
                                Text("어제 쌓인 이자")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color(hex: "B8BEC5"))
                                Text("114원 지금받기")
                                    .font(.system(size: 18))
                                    .foregroundColor(Color(hex: "7D8590"))
                            } // VStack
                            Spacer()
                            Image("arrow.forward")
                                .resizable()
                                .frame(width: 7, height: 13)
                        } // HStack
                        .padding(.vertical, 20)
                        
                        ZStack {
                            Divider()
                                .frame(height: 16)
                                .overlay(Color(hex: "F2F4F6"))
                                .padding(.horizontal, -28)
                        }
                        
                        HStack {
                            Text("전체")
                                .font(.system(size: 16))
                                .foregroundColor(Color(hex: "8F96A0"))
                            Image("arrow.down")
                                .resizable()
                                .frame(width: 13, height: 7)
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .frame(width: 20, height: 19)
                                .foregroundColor(Color(hex: "5C6A7B"))
                            
                            
                        } // HStack
                        .padding(.vertical, 10)
                        
                        VStack(alignment: .leading) {
                            Text("3월 22일")
                                .font(.system(size: 13))
                                .foregroundColor(Color(hex: "AFB5BC"))
                                .padding(.vertical, 5)
                            
                            ForEach(bankData.modeling[0], id: \.id) { item in
                                DemoRow3(data: item).listRowSeparator(.hidden)
                            } // ForEach
                        } // VStack
                        
                        VStack(alignment: .leading)  {
                            Text("3월 21일")
                                .font(.system(size: 13))
                                .foregroundColor(Color(hex: "AFB5BC"))
                                .padding(.vertical, 5)
                            ForEach(bankData.modeling[1], id: \.id) { item in
                                DemoRow3(data: item).listRowSeparator(.hidden)
                            } // ForEach
                        } // VStack
                        
                    } // VStack
                    .padding(.horizontal, 28)
                } // ScrollView
            case .mybank:
                VStack {
                    Text("기능 준비중")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "7D8590"))
                } // VStack
                .padding(.vertical, 300)
                
            case .search:
                VStack {
                    Text("기능 준비중")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "7D8590"))
                } // VStack
                .padding(.vertical, 300)
            }
        }
    }
}
//
//#Preview {
//    detailPage(path: $path)
//}
