//
//  Book.swift
//  Lab Week 4 MAD
//
//  Created by Bryan Fernando Dinata on 05/03/26.
//

import Combine
import Foundation

struct Book: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let author: String
    let systemImage: String
    let pageCount: Int
    let synopsis: String
}

class AppViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var selectedTab: Int = 0
    @Published var savedBooks: [Book] = []
    
    // Dummy Data for Explore Page
    @Published var allBooks: [Book] = [
        Book(title: "The Swift Programming Language", author: "Apple", systemImage: "swift", pageCount: 500, synopsis: "The official guide to Swift. A must-read for iOS developers."),
        Book(title: "1984", author: "George Orwell", systemImage: "eye", pageCount: 328, synopsis: "A dystopian social science fiction novel and cautionary tale."),
        Book(title: "To Kill a Mockingbird", author: "Harper Lee", systemImage: "bird", pageCount: 281, synopsis: "A novel about the serious issues of rape and racial inequality."),
        Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", systemImage: "sparkles", pageCount: 218, synopsis: "A story of the fabulously wealthy Jay Gatsby and his love for the beautiful Daisy Buchanan.")
    ]
    
    func toggleSave(book: Book) {
        if let index = savedBooks.firstIndex(where: { $0.id == book.id }) {
            savedBooks.remove(at: index)
        } else {
            savedBooks.append(book)
        }
    }
    
    func isSaved(book: Book) -> Bool {
        return savedBooks.contains(where: { $0.id == book.id })
    }
    
    func removeSavedBook(_ book: Book) {
        savedBooks.removeAll { $0.id == book.id }
    }
}

