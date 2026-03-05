//
//  SavedBooksView.swift
//  Lab Week 4 MAD
//
//  Created by Bryan Fernando Dinata on 05/03/26.
//

import SwiftUI

struct SavedBooksView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.savedBooks.isEmpty {
                    VStack {
                        Image(systemName: "bookmark")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                            .padding(.bottom, 10)
                        Text("Your saved list is empty.")
                            .foregroundColor(.gray)
                    }
                } else {
                    List {
                        ForEach(viewModel.savedBooks) { book in
                            NavigationLink(destination: BookDetailsView(book: book)) { // [cite: 139]
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
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    viewModel.removeSavedBook(book)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Saved")
        }
    }
}
