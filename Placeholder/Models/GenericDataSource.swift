//
//  GenericDataSource.swift
//  Placeholder
//
//  Created by Hugo Flores Perez on 4/4/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import Foundation

protocol GenericData {
    func onDataDidSet()
}

class GenericDataSource<T>: NSObject, GenericData {
    var data: [T]? = [] {
        didSet { onDataDidSet() }
    }
    
    func onDataDidSet() {}
}

