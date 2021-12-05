//
//  ContentView.swift
//  demo
//
//  Created by cody on 12/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    var body: some View {
        
        
        NavigationView {
            TabView(selection: $selection) {

                MeetingPageView().environmentObject(getMeetTable())
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("home")
                }
                .tag(0)
//                .navigationBarTitle("home").navigationBarHidden(false)
         
                LanguageList()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("profile")
                    }
                .tag(1)
//                .navigationBarTitle("").navigationBarHidden(true)
                
            }.navigationBarHidden(true)
            .accentColor(.red)
            .onAppear() {
                UITabBar.appearance().barTintColor = .white
            }
        }
        
        
    }
}


func getMeetTable() -> MeetingTable{
    
    let message1 = Message(id: 1, type: .text, userId: 1, meetingId: 1, message: "say hello", createdTime: Date(), attachId: nil)
    
    let message2 = Message(id: 1, type: .text, userId: 1, meetingId: 1, message: "How are you", createdTime: Date(), attachId: nil)
    
    var meeting1 = Meeting(id: 1, userId: 1, name: "bob", portraitImage: "sun.max.fill")
    meeting1.messages = [message1]
    
    var meeting2 = Meeting(id: 2, userId: 1, name: "tom", portraitImage: "moon.circle.fill")
    meeting2.messages = [message2]
    
    return MeetingTable(meetings: [meeting1,meeting2])
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
