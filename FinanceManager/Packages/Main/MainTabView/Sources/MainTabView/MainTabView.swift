//
//  MainTabView.swift
//  MainTabView
//
//  Created by Ульяна Гритчина on 17.08.2026.
//

import SwiftUI
import Home

public struct MainTabView: View {
    private let homeViewModel: HomeViewModel
    
    public init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    public var body: some View {
        TabView {
            HomeView(viewModel: homeViewModel)
                .tabItem { Label("Home", systemImage: "house") }
            
            Text("Analytics")
                .tabItem { Label("Analytics", systemImage: "chart.pie.fill") }
            
            Text("Analytics")
                .tabItem { Label("Settings", systemImage: "gear") }
        }
    }
}
