//
//  Room Type.swift
//  Hotel Codables
//
//  Created by Nash Clinton on 10/30/24.
//

import Foundation

struct RoomType: Equatable {
    var name: String
    var shortName: String
    var id: Int
    var price: Double
    
    static func ==(lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
        
    }
    static var all: [RoomType] {
        return [RoomType(name: "Two Queens" , shortName: "2Q", id: 0, price:179),
                RoomType(name: "One King", shortName: "K", id: 1, price: 209),
                RoomType(name: "Penthouse Suite", shortName: "PHS", id: 2, price: 309),
        ]
    }
}


