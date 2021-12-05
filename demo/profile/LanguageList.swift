//
//  LanguageList.swift
//  demo
//
//  Created by cody on 12/5/21.
//

import SwiftUI

struct LanguageList: View {
    
    let languages = ["English", "Chinese"]
    @State var selectedLanguage: String? = nil
    
    var body: some View {

        self.navigationTitle("")
        self.navigationBarHidden(true)
        
            List {
                ForEach(languages, id: \.self) { item in
                    SelectionCell(language: item, selectedLanguage: self.$selectedLanguage)
                }
            }
        }
}

struct SelectionCell: View {

    let language: String
    @Binding var selectedLanguage: String?

    var body: some View {
        HStack {
            Text(language)
            Spacer()
            if language == selectedLanguage {
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
            }
        }.onTapGesture {
                self.selectedLanguage = self.language
            }
    }
}

struct LanguageList_Previews: PreviewProvider {
    static var previews: some View {
        LanguageList()
    }
}
