//
//  Meeting.swift
//  demo
//
//  Created by cody on 12/3/21.
//

import Foundation

enum MeetingType: String, Codable {
    case user
    case group
    case notify
    case channel
}

struct Meeting: Identifiable, Codable {
    
    var id: Int64
    var name: String
    var userId: Int64
    var otherId: Int64?
    var type: MeetingType = .user
    var portraitImage: String
    var replyable: Bool = false
    var mute: Bool = false
    var blocked: Bool = false
    
    var isChoosed: Bool = false
    var messages: Array<Message>?
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json: Data?) {
        if json != nil, let value = try? JSONDecoder().decode(Meeting.self, from:json! ) {
            self = value
        }else{
            return nil
        }
    }
    
    func newMessagesCount() -> Int? {
        if let ms = messages{
            return ms.count
        }
        return nil
    }
    
    func lastMessage() -> String {
        if let m = messages?.last {
            return m.message
        }
        return ""
    }
    
    func lastMessageTime() -> Date? {
        if let m = messages?.last {
            return m.createdTime
        }
        return nil
    }
    
    init(id: Int64, userId: Int64, name: String, portraitImage: String) {
        self.id = id
        self.userId = userId
        self.name = name
        self.portraitImage = portraitImage
    }
}

struct MeetingArray {
    private(set) var meetings: Array<Meeting>
    
    private var indexOfChosenOne: Int? {
        get { meetings.indices.filter{ meetings[$0].isChoosed }.first }
        set {
            for index in meetings.indices {
                meetings[index].isChoosed = index == newValue
            }
        }
    }
    
    mutating func choose(_ meeting: Meeting) {
        if let chosenIndex = meetings.firstIndex(where: { $0.id == meeting.id }), !meetings[chosenIndex].isChoosed {
            if let lastChosenIndex = indexOfChosenOne {
                meetings[lastChosenIndex].isChoosed = false
            }
            indexOfChosenOne = chosenIndex
        }
    }
    
    mutating func remove(_ meeting: Meeting) {
        if let index = meetings.firstIndex(where: { meeting.id == $0.id }) {
            meetings.remove(at: index)
        }
    }
    
}
