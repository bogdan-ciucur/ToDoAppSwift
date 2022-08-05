//
//  ListView.swift
//  todo_new
//
//  Created by dev on 06.06.2022.
//

import SwiftUI
struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if(listViewModel.items.isEmpty) {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
                
                    .font(.largeTitle)
                
            } else {
                //lista pt fiecare todo
                List {
                    ForEach (listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform:
                                listViewModel.moveItem)
                }
                
                //styling
                .listStyle(PlainListStyle())
            }
        }

        
        //partea de sus cu titlul
        .navigationTitle("Todo List ✏️")
        
        //partea de navigatie, unde gasim butoanele pt edit si add
        .navigationBarItems(
            //in stanga - butonul pt edit/done
            leading: EditButton(),
            
            //in partea dreapta - butonul pt add - buton pt adaugarea unui task
            trailing:
                NavigationLink("Add", destination: AddView())
            )
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {

        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())

    }
}


