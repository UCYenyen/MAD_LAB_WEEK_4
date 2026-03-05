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
                                        .lineLimit(2)
                                    Text(book.author)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    viewModel.removeSavedBook(book)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(Color.red.opacity(0.8))
                                        .frame(width: 40, height: 40)
                                        .background(Color.red.opacity(0.1))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(.borderless)
                            }
                            .padding(.vertical, 5)
                            .background(
                                NavigationLink(destination: BookDetailsView(book: book)) {
                                    EmptyView()
                                }
                                .opacity(0)
                            )
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Saved")
        }
    }
}
