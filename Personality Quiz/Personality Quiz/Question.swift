//
//  Question.swift
//  Personality Quiz
//
//  Created by Nash Clinton on 9/30/24.
//

import Foundation
    
struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: IceCreamType
}
enum IceCreamType: String {
    case chocolate = "Chocolate", vanilla = "Vanilla", strawberry = "Strawberry", mint = "Mint", pistachio = "Pistachio"
    
    var definition: String {
        switch self {
        case .chocolate:
            return "You are a warm and kind soul who loves to laugh. You prefer spending your time watching netflix wrapped in a blanket with a bag of m&m's next to you. You aren't the most outgoing person, and prefer to spend time with a small selective group."
        case .vanilla:
            return "You are extremely chill and rarely ever get into contentions with others. You prefer spending your time at the beach or the pool, absorbing the rays of the sun and flowing with the ebb and flow of the waves. People like being around you, and you are more or less neutral about spending time with people. It just happens, you know?"
        case .strawberry:
            return "You are a very energetic and spend most of your time hanging out with friends. You prefer to spend your time partying all night and sleeping all day. You rarely back down when challenged, and often times get yourself in dicey spots. You love being around people and would all the time if you can help, except when you're sleeping."
        case .mint:
            return "You are the level-headed person in your group. When everyone plans on doing something stupid you are the first snap them out of it. You love spending time outside and going on hikes. If you could help it, you would camp every weekend. You enjoy being around people occasionally, but you can't stand being around them all the time."
        case . pistachio:
            return "You are the wild card of the group. One moment you want to be alone and the next thing you know you are hosting a party. Did you actually just agree to that? Sometimes you overstep what you can and cannot do, but you say yes to it anyways. Now that you think of it, what haven't you done?"
        }
    }
}
