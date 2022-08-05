//
//  ListViewModel.swift
//  todo_new
//
//  Created by dev on 07.06.2022.
//

import Foundation



class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        
        didSet {
            saveItems()
        }
        
    }
    let itemsKey:String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {

        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try?  JSONDecoder().decode([ItemModel].self, from: data )
        else { return }
        
        self.items = savedItems
        
    }
    
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        
        //variabila pt stocarea primului index
        
//        if let firstCompleted = items.firstIndex(where: { $0.isCompleted}) {
//            items.insert(newItem, at: firstCompleted)
//        }
        
        items.insert(newItem, at:0)
    }
    
    func updateItem(item: ItemModel) {
        
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items.remove(at: index)
            let newItem = item.updateCompletion()
            
            
            if(item.isCompleted) {
                items.insert(newItem, at: 0)
            } else {
                items.append(newItem)
            }
            
        }
            
    }
    
    
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
}
