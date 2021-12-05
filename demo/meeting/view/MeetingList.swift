//
//  MeetingList.swift
//  demo
//
//  Created by cody on 12/3/21.
//

import SwiftUI

struct MeetingList: View {
    
    @ObservedObject var meetingTable: MeetingTable
    
    @State private var editMode: EditMode = .inactive
    
    var meetings : Array<Meeting> {
        meetingTable.mettings
    }
    
    var body: some View {
        
        List {
            
            ForEach(meetings) { meeting in
                
                
                NavigationLink(destination: MessageList(messages: meeting.messages).navigationBarTitleDisplayMode(.inline).navigationTitle(meeting.name)){
                    
                    MeetingCellView(meeting: meeting).environmentObject(meetingTable).onTapGesture {
                        meetingTable.choose(meeting)
                    }
                    
                }
                
            }.onDelete { indexSet in
                indexSet.map{ meetings[$0] }.forEach{ meeting in
                    
                    meetingTable.remove(meeting)
                }
            }
        }
        .environment(\.editMode, $editMode)
        
    }
}

struct MeetingCellView: View {
    
    @EnvironmentObject var meetingTable: MeetingTable
    
    var meeting: Meeting
    
    var body: some View {
        
        HStack {
            
            VStack {
                
                Image(systemName: meeting.portraitImage)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60).numberBadge(meeting.newMessagesCount() ?? 0)
                
            }.frame(width: 60, height: 60)
            
            HStack {
                
                VStack(alignment: .leading) {
                    
                    contentPanel(meeting)
                    
//                    Divider()
//                        .frame(height: 1)
                }
            }
            
        }
//        .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
//        .onTapGesture {
//            print("chosen")
//        }
    }
    
    @ViewBuilder
    private func contentPanel(_ meeting:Meeting) -> some View {
        
        HStack(alignment: .top) {
            
            contentBar(meeting)
            
            Spacer()
            
            sidebar(meeting)
        }
    }
    
    @ViewBuilder
    private func contentBar(_ meeting:Meeting) -> some View {
        VStack {
            Text(meeting.name).font(.headline).font(.subheadline).frame(width: 190, height: 25, alignment: .leading)
            Text(meeting.lastMessage()).font(.subheadline).frame(width: 190, height: 35, alignment: .leading)
        }
    }
    
    @ViewBuilder
    private func sidebar(_ meeting:Meeting) -> some View {
        VStack {
            Text(Date(), style: .time).font(.subheadline).frame(width: 80, height: 25, alignment: .leading)
            
        }
    }
}

struct MeetingTableView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingList(meetingTable: getMeetTable())
    }
    static func getMeetTable() -> MeetingTable{
        
        let message = Message(id: 1, type: .text, userId: 1, meetingId: 1, message: "say hello", createdTime: Date(), attachId: nil)
        
        var meeting1 = Meeting(id: 1, userId: 1, name: "bob", portraitImage: "sun.max.fill")
        meeting1.messages = [message]
        
        let meeting2 = Meeting(id: 2, userId: 1, name: "tom", portraitImage: "moon.circle.fill")
        
        return MeetingTable(meetings: [meeting1,meeting2,meeting1,meeting2])
    }
}
