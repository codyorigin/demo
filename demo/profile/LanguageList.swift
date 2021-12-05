//
//  LanguageList.swift
//  demo
//
//  Created by cody on 12/5/21.
//

import SwiftUI

struct LanguageList: View {
    
    let languages = ["English", "Chinese"]
    @State var selectedLanguage: String = "English"
    @State var lang: String = "en"
    
    var body: some View {
        
        VStack{
            
            Text("Dynamic Language Change").environment(\.locale, .init(identifier: lang))

            List {
                ForEach(languages, id: \.self) { item in
                    SelectionCell(language: item, selectedLanguage: self.$selectedLanguage, lang: self.$lang)
                }
            }
        }
    }
}

struct SelectionCell: View {

    let language: String
    @Binding var selectedLanguage: String
    @Binding var lang: String

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
            if self.language == "English" {
                self.lang = "en"
            }else{
                self.lang = "zh-Hans"
            }
        }
    }
}

struct LanguageList_Previews: PreviewProvider {
    static var previews: some View {
        LanguageList()
    }
}
