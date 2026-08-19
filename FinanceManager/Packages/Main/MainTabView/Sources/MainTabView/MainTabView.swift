//
//  MainTabView.swift
//  MainTabView
//
//  Created by Ульяна Гритчина on 17.08.2026.
//

import SwiftUI
import Home

public struct MainTabView: View {
    public init() { }
    
    public var body: some View {
        TabView {
            Text("Home")
                .tabItem { Label("Home", systemImage: "house") }
            
            Text("Analytics")
                .tabItem { Label("Analytics", systemImage: "chart.pie.fill") }
            
            Text("Analytics")
                .tabItem { Label("Settings", systemImage: "gear") }
        }
    }
}

#Preview {
    MainTabView()
}
