//
//  MainTabView.swift
//  MainTabView
//
//  Created by Ульяна Гритчина on 17.08.2026.
//

import SwiftUI
import Home

struct MainTabView: View {
    var body: some View {
        TabView {
            EmptyView()
                .tabItem { Label("Home", systemImage: "house") }
            
            EmptyView()
                .tabItem { Label("Analitics", systemImage: "person.fill") }
            
            EmptyView()
                .tabItem { Label("Settings", systemImage: "person.fill") }
        }
    }
}

#Preview {
    MainTabView()
}
