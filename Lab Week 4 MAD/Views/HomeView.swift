//
//  HomeView.swift
//  Lab Week 4 MAD
//
//  Created by Bryan Fernando Dinata on 05/03/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Welcome back, User")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                Text("Your Library")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                if viewModel.savedBooks.isEmpty {
                    VStack {
                        Image(systemName: "bookmark.slash")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                            .padding(.bottom, 10)
                        
                        Text("No books saved yet.")
                            .foregroundColor(.gray)
                            .padding(.bottom, 20)
                        
                        Button("Discover Books") {
                            viewModel.selectedTab = 1
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(20)
                        .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity)
                } else {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Recently Saved")
                                .font(.headline)
                            Spacer()
                            Text("\(viewModel.savedBooks.count) Books")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(viewModel.savedBooks) { book in
                                    NavigationLink(destination: BookDetailsView(book: book)) {
                                        VStack(alignment: .leading) {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color(UIColor.systemGray6))
                                                .frame(width: 120, height: 160)
                                                .overlay(
                                                    Image(systemName: book.systemImage)
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                )
                                            
                                            Text(book.title)
                                                .font(.subheadline)
                                                .fontWeight(.semibold)
                                                .lineLimit(2)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: 120, alignment: .leading)
                                                .foregroundColor(.black)
                                            
                                            Text(book.author)
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        Button("View All Saved") {
                            viewModel.selectedTab = 2 // Navigate to Saved Book Page [cite: 114]
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding()
                        
                        Spacer()
                    }
                }
            }
            .padding(.top)
        }
    }
}
#Preview("HomeView - Empty Library") {
    let vm = AppViewModel()
    vm.isAuthenticated = true
    vm.savedBooks = []
    return HomeView()
        .environmentObject(vm)
}

#Preview("HomeView - With Saved Books") {
    let vm = AppViewModel()
    vm.isAuthenticated = true
    vm.savedBooks = [
        Book(title: "Sample A", author: "Author A", systemImage: "book", pageCount: 100, synopsis: "Synopsis A"),
        Book(title: "Sample B", author: "Author B", systemImage: "book.fill", pageCount: 200, synopsis: "Synopsis B")
    ]
    return HomeView()
        .environmentObject(vm)
}

