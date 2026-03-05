//
//  Lab_Week_4_MADApp.swift
//  Lab Week 4 MAD
//
//  Created by Bryan Fernando Dinata on 05/03/26.
//

import SwiftUI

@main
struct Lab_Week_4_MADApp: App {
    @StateObject private var viewModel = AppViewModel()
        
        var body: some Scene {
            WindowGroup {
                if viewModel.isAuthenticated {
                    MainTabView()
                        .environmentObject(viewModel)
                } else {
                    LoginView()
                        .environmentObject(viewModel)
                }
            }
        }
}
