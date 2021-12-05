//
//  Category.swift
//  demo
//
//  Created by cody on 12/3/21.
//

import Foundation

enum CategoryLevel: String, Decodable {
    
    case zero
    case one
    case two
}

struct Category: Identifiable, Decodable {
    
    var id: Int64
    var name: String
    var level: CategoryLevel
    var image:String
}

struct CategoryArray {
    var categories:Array<Category> = [Category]()
    
    mutating func choose(category: Category) {
        print("Choose \(category)")
    }
}
