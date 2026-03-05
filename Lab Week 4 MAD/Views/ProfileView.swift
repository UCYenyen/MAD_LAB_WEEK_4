//
//  ProfileView.swift
//  Lab Week 4 MAD
//
//  Created by Bryan Fernando Dinata on 05/03/26.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 100))
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
                
                Text("John Doe")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("johndoe@example.com")
                    .foregroundColor(.gray)
                    .padding(.bottom, 30)
                
                Text("Avid reader. Tech enthusiast, and minimalisit.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 40)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        viewModel.isAuthenticated = false // Sign out navigating back to Login Page
                        viewModel.selectedTab = 0
                        viewModel.savedBooks.removeAll() // Optional: clear session data
                    }
                }) {
                    Text("Sign Out")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(10)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            }
            .navigationTitle("Profile")
        }
    }
}
