//
//  CategoryGrid.swift
//  demo
//
//  Created by cody on 12/3/21.
//

import Foundation

class CategoryGrid: ObservableObject {
    
    @Published private var categoryArray: CategoryArray
    
    init(categories:Array<Category>) {
        self.categoryArray = CategoryArray(categories: categories)
    }
    
    var categories: Array<Category> {
        categoryArray.categories
    }
    
    func choose(_ category: Category){
        categoryArray.choose(category: category)
    }
}
