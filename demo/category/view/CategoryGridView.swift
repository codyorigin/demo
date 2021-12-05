//
//  CategoryGridView.swift
//  demo
//
//  Created by cody on 12/3/21.
//

import SwiftUI

struct CategoryGridView: View {
    
    @ObservedObject var categoryGrid: CategoryGrid = CategoryGrid()
    
    var columns: [GridItem] {
        [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    }
    
    var body: some View {
        
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    
                    ForEach(categoryGrid.categories.indices, id: \.self) { index in

                        CategoryCardView(category: categoryGrid.categories[index]).onTapGesture {
                            categoryGrid.choose(categoryGrid.categories[index])
                        }
                    }
                    
                }.padding(.horizontal)
            }.onAppear{categoryGrid.fetch()}
    }
    
}


struct CategoryCardView: View {
    var category: Category
    
    var body: some View {
        
        VStack {
            
            Image(systemName: category.image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            
            Text(LocalizedStringKey(category.name)).font(.caption).font(.subheadline).frame(width: 80, height: 22)
        }.padding(5).background(Color.white)
    }
}

struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
    }
}
