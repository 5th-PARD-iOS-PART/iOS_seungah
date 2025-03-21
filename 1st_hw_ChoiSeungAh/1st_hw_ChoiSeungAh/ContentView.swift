//
//  ContentView.swift
//  1st_hw_ChoiSeungAh
//
//  Created by 최승아 on 3/18/25.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldShowAlert: Bool = false
    @State private var showEmoji: Bool = false
    @State private var emojiOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(  //배경 그라디언트
                colors: [
                    Color.white, Color(red: 1.0, green: 0.6, blue: 0.3) // 색상 커스텀
                ]),
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HStack(spacing: 10) {
                    Image("sky1")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .padding(5)
                        .frame(width: 150, height: 150)
                        .shadow(color: .gray, radius: 5, x: 2, y: 2)
                    
                    Image("food")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .padding(5)
                        .frame(width: 150, height: 150)
                        .shadow(color: .gray, radius: 5, x: 2, y: 2)
                    
                    Image("4")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .padding(5)
                        .frame(width: 150, height: 150)
                        .shadow(color: .gray, radius: 5, x: 2, y: 2)
                }
                Image("6")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .padding(5)
                    .background(Color(red: 1.0, green: 0.9, blue: 0.8))
                    .frame(width: 200, height: 200)
                    .cornerRadius(100)
                    .shadow(color: .gray, radius: 5, x: 2, y: 2)
                
                Text("최승아")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 5, x: 2, y: 2)
                
                Text("04년생  ESFJ  산책  노래듣기  사진찍기  🤍❤️")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 7, x: 2, y: 2)
                 
                
                Button("더 알아보기!") {
                    shouldShowAlert = true
                }
                .font(.system(size: 18))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 3, x: 2, y: 2)
                .padding()
                .frame(width: 150)
                .cornerRadius(20)
                .confirmationDialog("알림창입니다", isPresented: $shouldShowAlert) {
                                                            // 새로운 다이얼로그
                    Button("확인") {
                        launchEmoji() // 이모지 날리기 기능 추가
                    }
                    
                    Button("취소", role: .cancel) {}
                } message: {
                    Text("잘 부탁드립니다~")
                }
                HStack(spacing: 10) {
                    Image("3")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .padding(5)
                        .frame(width: 150, height: 150)
                        .shadow(color: .gray, radius: 5, x: 2, y: 2)
                    
                    Image("sky2")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .padding(5)
                        .frame(width: 150, height: 150)
                        .shadow(color: .gray, radius: 5, x: 2, y: 2)
                    
                    Image("food2")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .padding(5)
                        .frame(width: 150, height: 150)
                        .shadow(color: .gray, radius: 5, x: 2, y: 2)
                }
            }
            
            if showEmoji {
                Text("👍")
                    .font(.system(size: 50))
                    .offset(y: emojiOffset)
                    .opacity(showEmoji ? 1 : 0)
                    .animation(.easeOut(duration: 1), value: emojiOffset)
            }
        }
    }
    
    private func launchEmoji() {
        emojiOffset = 0
        showEmoji = true
        
        withAnimation {
            emojiOffset = -300  // 위로 올라가는 거리 설정
        }
        
        // 일정 시간 후 이모티콘 사라지기
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation {
                showEmoji = false
            }
        }
    }
}



#Preview {
    ContentView()
}
