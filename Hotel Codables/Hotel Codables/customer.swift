//
//  customer.swift
//  Hotel Codables
//
//  Created by Nash Clinton on 10/29/24.
//

import Foundation

struct Customer {
    var firstName: String
    var lastName: String
    var email: String
    
    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var wantsWifi: Bool
    var roomType: RoomType
}


