//
//  DemoRow.swift
//  3rd_hw_ChoiSeungAh
//
//  Created by 최승아 on 3/30/25.
//

import SwiftUI

struct DemoRow: View {
    @Binding var path: NavigationPath
    
    var data: homeData
    
    var body: some View {
        HStack {
            Image(data.bank)
                .resizable()
                .frame(width: 35, height: 35)
                .padding(.vertical, 5)
                .padding(.trailing, 6)
            
            VStack(alignment: .leading) {
                
                if data.sum == "118원" || data.sum == "15,257,990원" {
                    HStack {
                        Text(data.sum)
                            .font(.system(size: 18))
                            .padding(.vertical, 1)
                            .foregroundColor(Color(hex: "43464C"))
                        
                        if data.sum == "118원" {
                            Text("+4.42%")
                                .font(.system(size: 18))
                                .foregroundColor(Color(hex: "F2626E"))
                        }
                        
                        if data.sum == "15,257,990원" {
                            Text("-2.6%")
                                .font(.system(size: 18))
                                .foregroundColor(Color(hex: "5194F7"))
                        }
                    }
                } else {
                    Text(data.sum)
                        .font(.system(size: 18))
                        .padding(.vertical, 1)
                        .foregroundColor(Color(hex: "43464C"))
                }
                
                Text(data.name)
                    .font(.system(size: 14))
                    .padding(.vertical, 1)
                    .foregroundColor(Color(hex: "848D99"))
            } // VStack
            Spacer()
            
            let buttonText: String = {
                switch data.bank {
                case "3":
                    return "지금 받기"
                case "7", "10":
                    return ""
                default:
                    return "송금"
                }
            }()
            
            if !buttonText.isEmpty {
//                if data.bank == "2" {
//                    ZStack {
//                        NavigationStack {
//                            NavigationLink("디테일 페이지", value: "detail")
//                            //NavigationLink(destination: {detailPage()}, label: {EmptyView()}).opacity(0.0) // 정말 까다로운 아이...
//                            
//                        }
//                        .navigationDestination(for: String.self) { value in
//                            if value == "detail" {
//                                detailPage(path: $path)
//                            }
//                        }
//                        HStack {
//                            Spacer()
//                            Text(buttonText)
//                                .foregroundColor(Color(hex: "737C88"))
//                                .font(.system(size: 13))
//                                .padding(.horizontal, 16)
//                                .padding(.vertical, 8)
//                                .background(Color(hex: "F2F3F5"))
//                                .cornerRadius(8)
//                            
//                        }
//                    }
//                } // if
                if data.bank == "2" {
                                    Button {
                                        // Navigate to detail page
                                        path.append("detail")
                                    } label: {
                                        Text(buttonText)
                                            .foregroundColor(Color(hex: "737C88"))
                                            .font(.system(size: 13))
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 8)
                                            .background(Color(hex: "F2F3F5"))
                                            .cornerRadius(8)
                                    }
                                }
                else {
                    Text(buttonText)
                        .foregroundColor(Color(hex: "737C88"))
                        .font(.system(size: 13))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color(hex: "F2F3F5"))
                        .cornerRadius(8)
                } // else
            } // if
        } // HStack
    }
}
