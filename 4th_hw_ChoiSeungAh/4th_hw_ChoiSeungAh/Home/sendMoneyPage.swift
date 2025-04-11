import SwiftUI

struct sendMoneyPage: View {
    @Environment(\.presentationMode) var presentationMode
    var selectedData: sendData
    @State private var price: String = ""
    @State private var isBalanceSelected: Bool = false  // 잔액 버튼이 눌렸는지
    @State private var isPriceEntered: Bool = false // 금액이 입력되었는지
    @State private var validationMessage: Bool = false  // 오류 메시지
    @State private var amountToSend: Int = 0    // 다음 페이지에 금액 전달
    @FocusState private var isTextFieldFocused: Bool    // 포커스노드
    @Binding var path: NavigationPath
    private let balance: Int = 26656
    
    private var priceValue: Int {
        return Int(price.replacingOccurrences(of: ",", with: "")) ?? 0
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("내 토스뱅크 통장")
                    .font(.system(size: 22))
                    .foregroundColor(Color(hex: "40454C"))
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                Text("에서")
                    .font(.system(size: 22))
                    .foregroundColor(Color(hex: "7E8894"))
                    .fontWeight(.medium)
                    .padding(.vertical, 15)
            }
            
            Text("잔액 26,656원")
                .font(.system(size: 15))
                .foregroundColor(Color(hex: "767E8A"))
                .fontWeight(.medium)
                .padding(.bottom, 50)
            
            HStack {
                Text("\(selectedData.bankName)")
                    .font(.system(size: 22))
                    .foregroundColor(Color(hex: "373D44"))
                    .fontWeight(.semibold)
                    .padding(.bottom, 15)
                Text("으로")
                    .font(.system(size: 22))
                    .foregroundColor(Color(hex: "87909B"))
                    .fontWeight(.medium)
                    .padding(.bottom, 15)
            }
            
            Text("\(selectedData.bank)")
                .font(.system(size: 16))
                .foregroundColor(Color(hex: "A3ABB4"))
                .padding(.bottom, 40)
                .fontWeight(.medium)
            
            TextField("얼마나 옮길까요?", text: $price)
                .font(.system(size: 31))
                .fontWeight(.semibold)
                .foregroundColor(isPriceEntered ? Color(hex: "3B4048") : Color(hex: "98A0AB"))
            
                .padding(.bottom, 10)
                .keyboardType(.numberPad)
                .focused($isTextFieldFocused)
                .onAppear {
                    // 화면이 나타날 때 키보드에 포커스 설정
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isTextFieldFocused = true
                    }
                }
                .onChange(of: price) { _, newValue in
                    
                    price = newValue.filter { "0123456789".contains($0) }   // 숫자만 필터링 (숫자 외 문자 제거)
                    validationMessage = priceValue > balance    // 입력된 금액이 잔액을 초과하는지
                    
                    isBalanceSelected = !newValue.isEmpty   // 금액이 입력되었는지
                    isPriceEntered = !newValue.isEmpty
                    
                    isTextFieldFocused = true   // 값이 변경되어도 포커스 유지
                }
            
            if validationMessage {
                Text("잔액이 \(balance)원이에요.")
                    .foregroundColor(Color(hex: "F36E79"))
                    .fontWeight(.medium)
                    .font(.system(size: 15))
                    .padding(.bottom, 5)
            } else if isBalanceSelected {   // 금액 입력 후 잔액 표시
                Text("잔액 \(price)원")
                    .font(.system(size: 15))
                    .foregroundColor(Color(hex: "6E7783"))
                    .fontWeight(.medium)
            } else {
                Button(action: {
                    price = "26656"
                    isBalanceSelected = true
                    validationMessage = false
                    isTextFieldFocused = true
                }) {
                    Text("잔액 26,656원")
                        .frame(width: 170, height: 38)
                        .font(.system(size: 15))
                        .foregroundColor(Color(hex: "6E7783"))
                        .fontWeight(.medium)
                        .background(Color(hex: "F2F3F5"))
                        .cornerRadius(6)
                }
            }
        }
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
        
        VStack {
            Spacer()
            
            if !price.isEmpty {  // 금액이 입력된 경우에만 다음 버튼 표시
                Button(action: {
                    amountToSend = priceValue
                    path.append(CheckSendDestination(amount: amountToSend, data: selectedData))
                }) {
                    Text("다음")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(Color(hex: "D4E4FC"))
                        .frame(maxWidth: .infinity)
                        .frame(height: 62)
                        .background(priceValue == 0 || priceValue > balance ? Color(hex: "C9DEFC") : Color(hex: "3182F6"))
                }
                .disabled(priceValue == 0 || priceValue > balance)
            }
        } // VStack
    }
}

// 확인 페이지로 데이터를 전달하기 위함
struct CheckSendDestination: Hashable {
    let amount: Int
    let data: sendData
    
    // 경로 구분
    func hash(into hasher: inout Hasher) {
        hasher.combine(amount)
        hasher.combine(data.id)
    }
    
    // 두 SendDestination이 동일한지 비교
    static func == (lhs: CheckSendDestination, rhs: CheckSendDestination) -> Bool {
        return lhs.amount == rhs.amount && lhs.data.id == rhs.data.id
    }
}
