//
//  Category.swift
//  demo
//
//  Created by cody on 12/3/21.
//

import Foundation

enum CategoryLevel{
    
    case zero
    case one
    case two
}

struct Category: Identifiable {
    
    var id: Int64
    var name: String
    var title: String
    var level: CategoryLevel
    var image:String
}

struct CategoryArray {
    var categories: Array<Category>
    
    mutating func choose(category: Category) {
        print("category choose \(category)")
    }
}
