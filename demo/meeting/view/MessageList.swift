//
//  MessageList.swift
//  demo
//
//  Created by cody on 12/3/21.
//

import SwiftUI

struct MessageList: View {
    
    var messages: Array<Message>?
    
    var body: some View {
        Text(messages?[0].message ?? "Hi")
    }
}
