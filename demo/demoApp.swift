//
//  demoApp.swift
//  demo
//
//  Created by cody on 12/3/21.
//

import SwiftUI

@main
struct demoApp: App {
    
    var body: some Scene {
        WindowGroup {
//            MeetingPageView().environmentObject(getMeetTable())
            ContentView()
        }
    }
    
//    func getMeetTable() -> MeetingTable{
//
//        let message = Message(id: 1, type: .text, userId: 1, meetingId: 1, message: "say hello", createdTime: Date(), attachId: nil)
//
//        var meeting1 = Meeting(id: 1, userId: 1, name: "bob", portraitImage: "sun.max.fill")
//        meeting1.messages = [message]
//
//        let meeting2 = Meeting(id: 2, userId: 1, name: "tom", portraitImage: "moon.circle.fill")
//
//        return MeetingTable(meetings: [meeting1,meeting2,meeting1,meeting2])
//    }
    
}
