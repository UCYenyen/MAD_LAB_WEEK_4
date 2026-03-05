//
//  MainTabView.swift
//  Lab Week 4 MAD
//
//  Created by Bryan Fernando Dinata on 05/03/26.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
                .tag(0)
            
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
                .tag(1)
            
            SavedBooksView()
                .tabItem { Label("Saved", systemImage: "bookmark") }
                .tag(2)
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
                .tag(3)
        }
        .tint(.black)
    }
}
