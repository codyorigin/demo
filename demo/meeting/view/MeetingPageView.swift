//
//  MeetingPageView.swift
//  demo
//
//  Created by cody on 12/3/21.
//

import SwiftUI

struct MeetingPageView: View {
    
    @EnvironmentObject var meetingTable: MeetingTable
    
    var body: some View {
        
        NavigationView {
            MeetingList(meetingTable: meetingTable)
                .navigationTitle("Meeting")
                .navigationBarItems(trailing: addSheet)
        }
    }
    
    @State private var showAdd = false
    
    var addSheet: some View {
        Button(action: {
            showAdd = true
        }, label: {
            Image(systemName: "plus").imageScale(.large)
        }).sheet(isPresented: $showAdd){
            Text("add")
        }
    }
}

struct MeetingPageView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingPageView().environmentObject(getMeetTable())
    }
    static func getMeetTable() -> MeetingTable{
        
        let message = Message(id: 1, type: .text, userId: 1, meetingId: 1, message: "say hello", createdTime: Date(), attachId: nil)
        
        var meeting1 = Meeting(id: 1, userId: 1, name: "bob", portraitImage: "sun.max.fill")
        meeting1.messages = [message]
        
        let meeting2 = Meeting(id: 2, userId: 1, name: "tom", portraitImage: "moon.circle.fill")
        
        return MeetingTable(meetings: [meeting1,meeting2,meeting1,meeting2])
    }
}
