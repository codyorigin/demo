//
//  CategoryGridView.swift
//  demo
//
//  Created by cody on 12/3/21.
//

import SwiftUI

struct CategoryGridView: View {
    
    @ObservedObject var categoryGrid: CategoryGrid
    
    var columns: [GridItem] {
        [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    }
    
    var body: some View {
        
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(categoryGrid.categories.indices) { index in
                        
                        CategoryCardView(category: categoryGrid.categories[index])
                    }
                }.padding(.horizontal)
            }
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
            
            Text(category.title).font(.caption).font(.subheadline).frame(width: 80, height: 22)
        }.padding(5).background(Color.white)
    }
}

struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView(categoryGrid: getCategoryGrid())
    }
    
    static func getCategoryGrid() -> CategoryGrid {
        let category = Category(id: 1, name: "name", title: "title", level: .one, image: "sun.max.fill")
        return CategoryGrid(categories: [category,category,category, category])
    }
}
