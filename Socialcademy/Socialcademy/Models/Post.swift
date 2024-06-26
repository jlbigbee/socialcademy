//
//  Post.swift
//  Socialcademy
//
//  Created by Jonathan Bigbee on 6/26/24.
//

import Foundation

struct Post: Identifiable {
    var title: String
    var content: String
    var authorName: String
    var timestamp = Date()
    var id = UUID()
}

