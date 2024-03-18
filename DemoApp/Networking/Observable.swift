//
//  Observable.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 30/10/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
class Observable<T> {
    var value : T? {
        didSet{
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(_ value : T?) {
        self.value = value
    }
    
    private var listener : ((T?) -> Void)?
    
    func bind(_ listener : @escaping ((T?) -> Void)){
        listener(self.value)
        self.listener = listener
    }
}



