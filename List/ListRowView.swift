//
//  ListRowView.swift
//  todo_new
//
//  Created by dev on 06.06.2022.
//

import SwiftUI

struct ListRowView: View {
    @State var paddings = 10.0
    
    let item: ItemModel
    
    //    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        //        let randomLight:Color = Color(
        //            red: Double.random(in: 0...0.5),
        //            green: Double.random(in: 0...0.5),
        //            blue: Double.random(in: 0...0.5))
        //
        //        let randomDark:Color = Color(
        //            red: Double.random(in: 0.5...1),
        //            green: Double.random(in: 0.5...1),
        //            blue: Double.random(in: 0.5...1))
        //
        
        let completedColor = Color("CompletedTask")
        let uncompletedColor = Color("UncompletedTask")
        
        HStack {
            
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .white : .white)
            // .background(colorScheme == .dark ? randomLight : randomDark)
            
            Text(item.title)
                .foregroundColor(.white)
            
            // ocupa tot spatiul disponibil
            Spacer()
            
        }
        
        .font(.title2)
        .padding(paddings)
        .background(item.isCompleted ? completedColor : uncompletedColor)
        //.background(colorScheme == .dark ? randomLight : randomDark)
        .cornerRadius(10)
    }
    
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "first item", isCompleted: false)
    static var item2 = ItemModel(title: "second item", isCompleted: true)
    
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
    
    
    
    
    
}
