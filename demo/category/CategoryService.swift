//
//  CategoryService.swift
//  demo
//
//  Created by cody on 12/6/21.
//

import Foundation
import RxSwift

protocol CategoryServiceProtocol {
    func fetchCategories() -> Observable<[Category]>
}

class CategoryService {
    
    func fetchCategories() -> Observable<[Category]> {
        
        return Observable.create { observer -> Disposable in
            
            guard let path = Bundle.main.path(forResource: "categories", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create{ }
            }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let categories = try JSONDecoder().decode([Category].self, from: data)
                observer.onNext(categories)
                
            } catch {
                observer.onError(error)
            }
         
            return Disposables.create{ }
        }
    }
    
}
