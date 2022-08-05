//
//  todo_newApp.swift
//  todo_new
//
//  Created by dev on 06.06.2022.
//

import SwiftUI

@main
struct todo_newApp: App {
    
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                
                ListView()

            }
            
            //adaptare pt ipad
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
