//
//  ItemModel.swift
//  todo_new
//
//  Created by dev on 07.06.2022.
//

import Foundation




struct ItemModel: Identifiable, Codable, Equatable {
    public static func == (lhs: ItemModel, rhs: ItemModel) -> Bool {
        return lhs.id == rhs.id && lhs.isCompleted == rhs.isCompleted
    }
    
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id:String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion () -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
