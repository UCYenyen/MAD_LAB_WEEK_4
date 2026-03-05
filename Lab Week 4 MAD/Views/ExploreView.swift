//
//  ExploreView.swift
//  Lab Week 4 MAD
//
//  Created by Bryan Fernando Dinata on 05/03/26.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State private var searchText = ""
    
    var filteredBooks: [Book] {
        if searchText.isEmpty {
            return viewModel.allBooks
        } else {
            return viewModel.allBooks.filter { $0.title.localizedCaseInsensitiveContains(searchText) || $0.author.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredBooks) { book in
                NavigationLink(destination: BookDetailsView(book: book)) {
                    HStack(spacing: 15) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(UIColor.systemGray6))
                            .frame(width: 60, height: 80)
                            .overlay(
                                Image(systemName: book.systemImage)
                                    .foregroundColor(.black)
                            )
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(book.title)
                                .font(.headline)
                            Text(book.author)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Explore")
            .searchable(text: $searchText, prompt: "Search titles or authors")
        }
    }
}
