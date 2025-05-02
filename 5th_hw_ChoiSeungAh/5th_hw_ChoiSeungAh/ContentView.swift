//
//  ContentView.swift
//  5th_hw_ChoiSeungAh
//
//  Created by 최승아 on 5/1/25.
//

import SwiftUI

struct ContentView: View {
    // Create the necessary dependencies for ShoppingViewModel
    private let shoppingViewModel: ShoppingViewModel = {
        // Repository
        let repository = ShoppingRepositoryImpl()
        
        // UseCase
        let fetchShoppingUseCaseImpl = FetchShoppingUseCaseImpl(repository: repository)
        
        // ViewModel
        return ShoppingViewModel(fetchShoppingUseCase: fetchShoppingUseCaseImpl)
    }()
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().standardAppearance = appearance
    } // init
    
    var body: some View {
        TabView {
            HomePage()
            benefitPage()
            ShoppingView(shoppingViewModel: shoppingViewModel)
            stockPage()
            wholePage()
        } // TabView
        .accentColor(.black)
    }
}

#Preview {
    ContentView()
}
