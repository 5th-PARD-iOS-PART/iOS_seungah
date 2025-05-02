//
// ShoppingItemListView.swift
//  5th_hw_ChoiSeungAh
//
//  Created by 최승아 on 5/2/25.
//

import SwiftUI

struct ShoppingItemListView: View {
    let items: [ShoppingModel]
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        
        VStack(spacing: 0) {
            ForEach(items.indices, id: \.self) { index in
                let item = items[index]
                ForEach(item.title.indices, id: \.self) { i in
                    if i < item.image.count && i < item.title.count &&
                        i < item.salePrice.count && i < item.originalPrice.count &&
                        i < item.watching.count {
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Image(item.image[i])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: screenWidth - 14)
                            } // HStack
                            .padding(.vertical, 15)
                            .frame(width: screenWidth, alignment: .center)
                            
                            Text(item.title[i])
                                .font(.system(size: 12))
                                .fontWeight(.regular)
                                .foregroundColor(Color(hex: "677684"))
                                .lineLimit(2)
                                .padding(.bottom, 1)
                                .padding(.leading, 16)
                            
                            HStack {
                                Text(item.salePrice[i])
                                    .font(.system(size: 19))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(hex: "3E4D5C"))
                                Text(item.originalPrice[i])
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                                    .foregroundColor(Color(hex: "909EAB"))
                                    .strikethrough()
                                
                                if item.category != .special { // 특가를 제외한 나머지 카테고리에 모두 토스프라임
                                    HStack(spacing: 2) {
                                        Image("prime")
                                            .resizable()
                                            .frame(width: 12, height: 12)
                                            .foregroundColor(Color(hex: "ACB8C3"))
                                        Text("토스프라임 488원 적립")
                                            .font(.system(size: 12))
                                            .foregroundColor(Color(hex: "417DE0"))
                                    } // HStack
                                    .padding(.vertical, 4)
                                    .padding(.horizontal, 10)
                                    .background(Color(hex: "DEEBFD"))
                                    .cornerRadius(10)
                                } // if
                            } // HStack
                            .padding(.bottom, 1)
                            .padding(.leading, 16)
                            
                            Text(item.watching[i])
                                .font(.system(size: 10))
                                .fontWeight(.regular)
                                .foregroundColor(Color(hex: "7C8B99"))
                                .padding(.leading, 16)
                        } // VStack
                        .padding(.bottom, 20)
                    }
                } // ForEach
            } // ForEach
        } // VStack
        .frame(maxWidth: .infinity)
    }
}


// geometry와 scrollview를 같이 쓰면 밑으로 스크롤이 거의 안된다!
// UIScreen.main.bounds.width 기억하기
