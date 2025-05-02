//
//  ShoppingAllItemListView.swift
//  5th_hw_ChoiSeungAh
//
//  Created by 최승아 on 5/2/25.
//

import SwiftUI

struct ShoppingAllItemListView: View {
    @Bindable var viewModel: ShoppingViewModel
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let specialItem = viewModel.specialItem
        let sortedItems = viewModel.sortedItems
        
        VStack(spacing: 0) {
            HStack {
                Image("all1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: screenWidth - 14)
            } // HStack
            .padding(.top, 10)
            .frame(width: screenWidth, alignment: .center)
            
            HStack {
                Rectangle()
                    .fill(Color(hex: "DFE3E7"))
                    .frame(height: 1)
                Text("50초·스크롤 해야 시간이 줄어요")
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: "7D8C99"))
                    .fixedSize() // 사이즈 고정
                Rectangle()
                    .fill(Color(hex: "DFE3E7"))
                    .frame(height: 1)
            } // HStack
            .padding(.horizontal, 27)
            .padding(.vertical, 18)
            
            
            // 하루 특가
            HStack {
                Text("하루 특가")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "445361"))
                Spacer()
                Text("전체보기")
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                    .foregroundColor(Color(hex: "7B8A98"))
                Image(systemName: "chevron.right")
                    .frame(width: 8, height: 13)
                    .foregroundColor(Color(hex: "A4B4C1"))
            } // HStack
            .padding(.horizontal, 27)
            .padding(.top, 10)
            
            if let (specialModel, specialIndex) = specialItem,
               specialIndex < specialModel.image.count &&
                specialIndex < specialModel.title.count &&
                specialIndex < specialModel.salePrice.count &&
                specialIndex < specialModel.originalPrice.count &&
                specialIndex < specialModel.watching.count {
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(specialModel.image[specialIndex])
                            .resizable()
                            .scaledToFill()
                            .frame(width: screenWidth - 14)
                    } // HStack
                    .padding(.vertical, 15)
                    .frame(width: screenWidth, alignment: .center)
                    
                    Text(specialModel.title[specialIndex])
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .foregroundColor(Color(hex: "677684"))
                        .lineLimit(2)
                        .padding(.bottom, 1)
                        .padding(.leading, 16)
                    
                    HStack {
                        Text(specialModel.salePrice[specialIndex])
                            .font(.system(size: 19))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "3E4D5C"))
                        Text(specialModel.originalPrice[specialIndex])
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(Color(hex: "909EAB"))
                            .strikethrough()
                    } // HStack
                    .padding(.bottom, 1)
                    .padding(.leading, 16)
                    
                    Text(specialModel.watching[specialIndex])
                        .font(.system(size: 10))
                        .fontWeight(.regular)
                        .foregroundColor(Color(hex: "7C8B99"))
                        .padding(.leading, 16)
                } // VStack
                .padding(.bottom, 20)
            }
            
            // 오늘의 상품
            ZStack {
                // 정중앙 텍스트
                Text("00:47")
                    .font(.system(size: 12))
                    .foregroundColor(Color(hex: "6CA9FC"))
                    .padding(.vertical, 5)
                    .padding(.horizontal, 7)
                    .background(.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "D9DDE4"), lineWidth: 0.6)
                    )
                
                HStack {
                    // 왼쪽 고정
                    Text("오늘의 상품")
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hex: "445361"))
                    
                    Spacer()
                    
                    // 오른쪽 고정
                    Text("AD")
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: "C4CAD0"))
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hex: "C0C6CF"), lineWidth: 0.6)
                        )
                } // HStack
            } // ZStack
            .padding(.horizontal, 27)
            .padding(.top, 10)
            
            ForEach(sortedItems.indices, id: \.self) { index in
                let sortedItem = sortedItems[index]
                let model = sortedItem.model
                let i = sortedItem.index
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(model.image[i])
                            .resizable()
                            .scaledToFill()
                            .frame(width: screenWidth - 14)
                    } // HStack
                    .padding(.vertical, 15)
                    .frame(width: screenWidth, alignment: .center)
                    
                    Text(model.title[i])
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .foregroundColor(Color(hex: "677684"))
                        .lineLimit(2)
                        .padding(.bottom, 1)
                        .padding(.leading, 16)
                    
                    HStack {
                        Text(model.salePrice[i])
                            .font(.system(size: 19))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "3E4D5C"))
                        Text(model.originalPrice[i])
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(Color(hex: "909EAB"))
                            .strikethrough()
                        
                        if model.category != .special {
                            HStack(spacing: 2) {
                                Image("prime")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(Color(hex: "ACB8C3"))
                                Text("토스프라임 488원 적립")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(hex: "417DE0"))
                            }
                            .padding(.vertical, 4)
                            .padding(.horizontal, 10)
                            .background(Color(hex: "DEEBFD"))
                            .cornerRadius(10)
                        }
                    } // HStack
                    .padding(.bottom, 1)
                    .padding(.leading, 16)
                    
                    Text(model.watching[i])
                        .font(.system(size: 10))
                        .fontWeight(.regular)
                        .foregroundColor(Color(hex: "7C8B99"))
                        .padding(.leading, 16)
                } // VStack
                .padding(.bottom, 20)
            } // ForEach
            
            Spacer()
                .frame(height: 50)
            
        } // VStack
        .frame(maxWidth: .infinity)
        .onAppear {
            viewModel.processItems()
        }
    }
}
