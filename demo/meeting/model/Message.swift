//
//  Message.swift
//  demo
//
//  Created by cody on 12/3/21.
//

import Foundation

enum MessageType: String, Codable{
    
    case command
    case text
    case image
    case audio
    case video
    case location
    case card
    case invite
    case order
    case bid
    
}

enum MessageCommand{
    
    case update_conversation
    
}

struct Message: Identifiable, Codable {
    
    var id: Int64
    
    var type: MessageType
    
    var userId: Int64
    
    var meetingId: Int64
    
    var message: String
    
    var createdTime: Date
    
    var attachId: Int64?
}
