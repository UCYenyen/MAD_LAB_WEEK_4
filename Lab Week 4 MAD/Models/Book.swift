//
//  Book.swift
//  Lab Week 4 MAD
//
//  Created by Bryan Fernando Dinata on 05/03/26.
//

import Foundation

struct Book: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let author: String
    let systemImage: String
    let pageCount: Int
    let synopsis: String
}
