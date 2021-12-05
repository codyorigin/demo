//
//  CategoryGrid.swift
//  demo
//
//  Created by cody on 12/3/21.
//

import Foundation
import RxSwift


class CategoryGrid: ObservableObject {
    
    @Published private var categoryArray: CategoryArray = CategoryArray()
    
    let disposeBag = DisposeBag()
    
    var categories: Array<Category> {
        categoryArray.categories
    }
    
    func choose(_ category: Category) {
        categoryArray.choose(category: category)
    }
    
    
    func fetch() {
        let service = CategoryService()
        service.fetchCategories().subscribe(onNext: { categories in
            self.categoryArray.categories = categories
        }).disposed(by: disposeBag)
    }
}
