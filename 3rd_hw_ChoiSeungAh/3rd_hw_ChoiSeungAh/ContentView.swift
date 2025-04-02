//
//  ContentView.swift
//  3rd_hw_ChoiSeungAh
//
//  Created by 최승아 on 3/30/25.
//

import SwiftUI

struct ContentView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().standardAppearance = appearance
    } // init
    
    var body: some View {
        NavigationView{
            TabView {
                HomePage()
                benefitPage()
                shopPage()
                stockPage()
                wholePage()
            } // TabView
            .accentColor(.black)
        } // NavigationView
    }
}

#Preview {
    ContentView()
}
