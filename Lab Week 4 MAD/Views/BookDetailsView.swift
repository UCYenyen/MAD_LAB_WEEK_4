//
//  BookDetailsView.swift
//  Lab Week 4 MAD
//
//  Created by Bryan Fernando Dinata on 05/03/26.
//

import SwiftUI

struct BookDetailsView: View {
    @EnvironmentObject var viewModel: AppViewModel
    let book: Book
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(UIColor.systemGray6))
                    .frame(width: 200, height: 280)
                    .overlay(
                        Image(systemName: book.systemImage)
                            .font(.system(size: 80))
                            .foregroundColor(.black)
                    )
                    .padding(.top, 20)
                
                VStack(spacing: 8) {
                    Text(book.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text(book.author)
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                    Text("\(book.pageCount) Pages")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Button(action: {
                    viewModel.toggleSave(book: book)
                }) {
                    HStack {
                        Image(systemName: viewModel.isSaved(book: book) ? "bookmark.fill" : "bookmark")
                        Text(viewModel.isSaved(book: book) ? "Saved" : "Save")
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 30)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Synopsis")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(book.synopsis)
                        .font(.body)
                        .foregroundColor(.gray)
                        .lineSpacing(5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 30)
                .padding(.top, 10)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
