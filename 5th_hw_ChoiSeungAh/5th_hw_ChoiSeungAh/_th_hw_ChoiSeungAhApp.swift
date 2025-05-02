//
//  _th_hw_ChoiSeungAhApp.swift
//  5th_hw_ChoiSeungAh
//
//  Created by 최승아 on 5/1/25.
//

import SwiftUI

@main
struct _th_hw_ChoiSeungAhApp: App {
    var body: some Scene {
        
        //repository
        let repository = ShoppingRepositoryImpl()
        
        //useCase
        let fetchShoppingUseCaseImpl = FetchShoppingUseCaseImpl(repository: repository)
        
        //ViewModel
        let viewModel = ShoppingViewModel(fetchShoppingUseCase: fetchShoppingUseCaseImpl)
        
        WindowGroup {
            ShoppingView(shoppingViewModel: viewModel)
        }
    }
}
