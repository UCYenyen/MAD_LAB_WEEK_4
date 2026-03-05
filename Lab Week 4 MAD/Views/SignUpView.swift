//
//  SignUpView.swift
//  Lab Week 4 MAD
//
//  Created by Bryan Fernando Dinata on 05/03/26.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AppViewModel
    @State private var fullName = ""
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image(systemName: "book.pages")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            
            Text("BookApp")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 15) {
                TextField("Full Name", text: $fullName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal, 30)
            .padding(.top, 20)
            
            Button(action: {
                withAnimation {
                    viewModel.isAuthenticated = true
                }
            }) {
                Text("Register")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 30)
            .padding(.top, 10)
            
            Spacer()
            
            HStack {
                Text("Already have an account?")
                    .foregroundColor(.gray)
                Button("Sign In") {
                    dismiss()
                }
                .fontWeight(.bold)
                .foregroundColor(.black)
            }
            .padding(.bottom, 20)
        }
        .navigationBarBackButtonHidden(true)
    }
}
