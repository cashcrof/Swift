//
//  Book.swift
//  BookList
//
//  Created by user223323 on 11/1/22.
//

import Foundation

class Book {
    var title : String
    var ISBN : String
    var author : String
    var coverImageURL : String
    var rating : String
    var notes : String?


    init (title: String, ISBN: String, author: String, coverImageURL: String, rating: String, notes: String?){
        self.title = title
        self.ISBN = ISBN
        self.author = author
        self.coverImageURL = coverImageURL
        self.rating = rating
        self.notes = notes
    }
    
}
