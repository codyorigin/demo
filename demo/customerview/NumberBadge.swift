//
//  NumberBadge.swift
//  demo
//
//  Created by cody on 12/3/21.
//

import SwiftUI

struct NumberBadge: ViewModifier {
    
    @Binding var number: Int
    
    func body(content: Content) -> some View {
        
        GeometryReader { geometry in
            
            ZStack(alignment:.topLeading) {
                
                content
                
                if number != 0 {
                    
                    Text("\(number)").padding(5).background(Color.red).clipShape(Circle()).foregroundColor(.white).offset(x: geometry.size.width - 15, y: -15)
//                        .animation(.default, value: nil)
                }
            }
            
        }
    }
    
}


extension View {
    func numberBadge(_ count:Int) -> some View {
        self.modifier(NumberBadge(number: Binding.constant(2)))
    }
}
