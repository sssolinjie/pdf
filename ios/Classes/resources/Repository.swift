//
//  Repository.swift
//  pdf
//
//  Created by 林炳午 on 2024/3/8.
//

import Foundation
enum RepositoryError: Error {
    case ItemNotFound
}

class Repository<T> {
    var items: [String: T] = [:]
    
    public func get(id: String) throws -> T {
        if !exist(id: id) {
            throw RepositoryError.ItemNotFound
        }
        return items[id]!
    }
    
    public func set(id: String, item: T) {
        items[id] = item
    }
    
    private func exist(id: String) -> Bool {
        return items.keys.contains(id)
    }
    
    open func close(id: String) {
        items.removeValue(forKey: id)
    }
}
