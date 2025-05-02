//
//  ShoppingView.swift
//  3rd_hw_ChoiSeungAh
//
//  Created by 최승아 on 3/30/25.
//

import SwiftUI

struct ShoppingView: View {
    @Bindable var shoppingViewModel: ShoppingViewModel
    @State private var selectedCategory: ShoppingTab = .all
    @Namespace private var animation
    
    init(shoppingViewModel: ShoppingViewModel) {
        self.shoppingViewModel = shoppingViewModel
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("토스쇼핑")
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "2F3741"))
                Spacer()
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 24))
                    .foregroundColor(Color(hex: "ACB8C3"))
                Image(systemName: "person.fill")
                    .font(.system(size: 24))
                    .foregroundColor(Color(hex: "ACB8C3"))
                Image(systemName: "cart.fill")
                    .font(.system(size: 24))
                    .foregroundColor(Color(hex: "ACB8C3"))
            } // HStack
            .padding(.horizontal, 27)
            animate().padding(.horizontal, 20)
            tabView(shoppingViewModel: shoppingViewModel)
        } // VStack
        .onAppear {
            shoppingViewModel.fetchItems()
        }
        .navigationBarBackButtonHidden(true)
        .tabItem{
            Image(systemName: "bag.fill")
            Text("토스쇼핑")
        }
        .tag(2)
    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(ShoppingTab.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .foregroundColor(
                            selectedCategory == item
                            ? (item == .all ? Color(hex: "475563"): Color(hex: "248EFF"))
                            : Color(hex: "758593"))
                    
                    if selectedCategory == item {
                        Capsule()
                            .foregroundColor(item == .all ? Color(hex: "475563") : Color(hex: "248EFF"))
                            .frame(width: 40, height: 2)
                            .matchedGeometryEffect(id: item.rawValue, in: animation)
                    } // if
                    
                } // VStack
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedCategory = item
                        shoppingViewModel.selectedCategory = item
                        shoppingViewModel.fetchItems()
                    }
                }
            } // ForEach
        } // HStack
    } // animate()
}

struct tabView : View {
    @Bindable var shoppingViewModel: ShoppingViewModel
    @State private var selectedCategory: ShoppingTab = .all
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            switch shoppingViewModel.selectedCategory {
            case .all:
                ShoppingAllItemListView(viewModel: shoppingViewModel)
                
            case .special:
                VStack(alignment: .leading) {
                    Text("특가")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "464F5C"))
                        .padding(.top, 22)
                        .padding(.leading, 24)
                    ShoppingItemListView(items: shoppingViewModel.Items)
                }
                
            case .food, .clothes, .electronics, .beauty:
                VStack(alignment: .leading) {
                    Text(shoppingViewModel.selectedCategory.rawValue)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "464F5C"))
                        .padding(.top, 22)
                        .padding(.leading, 24)
                    ShoppingItemListView(items: shoppingViewModel.Items)
                }
            }
        }
    }
}

#Preview {
    //repository
    let repository = ShoppingRepositoryImpl()
    
    //useCase
    let fetchShoppingUseCaseImpl = FetchShoppingUseCaseImpl(repository: repository)
    
    //ViewModel
    let viewModel = ShoppingViewModel(fetchShoppingUseCase: fetchShoppingUseCaseImpl)
    
    
    ShoppingView(shoppingViewModel: viewModel)
    
}
