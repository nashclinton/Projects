//
//  PostController.swift
//  WaveWord
//
//  Created by Nash Clinton on 11/18/24.
//

import Foundation

class PostController {
    static let shared = PostController()
    var recentPost: Post?
    
    var posts: [Post] = [
        Post(postTitle: "Magic Mouse Sucks", postDescription: "The magic mouse is the absolute worst.", date: Date(), comments: ["who is this guy?", "Nah, you're so wrong dude"]) ,
        Post(postTitle: "Apple Watch is cool", postDescription: "The apple watch is good.", date: Date(), comments: ["who is this guy?"]),
        Post(postTitle: "Apple TV is good", postDescription: "The apple tv is nice.", date: Date(), comments: ["who is this guy?"]),
        Post(postTitle: "Apple Carplay is infuriating", postDescription: "The apple needs to play nice with cars.", date: Date(), comments: ["who is this guy?"]),
        Post(postTitle: "Apple Music is good", postDescription: "The apple music is nice.", date: Date(), comments: ["who is this guy?"]),
        Post(postTitle: "Apple Podcasts is good", postDescription: "The apple podcasts is nice.", date: Date(), comments: ["who is this guy?"]),
        Post(postTitle: "Rip Titan Project", postDescription: "Sad Day", date: Date(), comments: ["who is this guy?"]),
        Post(postTitle: "Apple TV+ is a total loss", postDescription: "yeah no", date: Date(), comments: ["who is this guy?"]),
        Post(postTitle: "Anyone remember the Humane Pin?", postDescription: "That thing never stood a chance it was soooo bad", date: Date(), comments: ["who is this guy?"]),
        Post(postTitle: "The Rabbit R1", postDescription: "That thing is a joke and a scam I can't believe they got so much funding for it", date: Date(), comments: ["who is this guy?"]),
    ]
}
