//
//  MeetingTable.swift
//  demo
//
//  Created by cody on 12/3/21.
//

import Foundation

class MeetingTable: ObservableObject  {
    
    @Published private var meetingArray: MeetingArray
    
    init(meetings:Array<Meeting>) {
        self.meetingArray = MeetingArray(meetings: meetings)
    }
    
    var mettings: Array<Meeting> {
        meetingArray.meetings
    }
    
    func choose(_ meeting: Meeting) {
        meetingArray.choose(meeting)
    }
    
    func remove(_ meeting: Meeting) {
        meetingArray.remove(meeting)
    }
    
}
