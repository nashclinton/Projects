import Foundation

struct Book {
    
    enum Genre{
        case sciFi, fantasy, romance, mystery, horror, histFiction, nonFiction, classic
    }
    var title: String
    var author: String
    var genre: Genre
    var Length: Int
}
