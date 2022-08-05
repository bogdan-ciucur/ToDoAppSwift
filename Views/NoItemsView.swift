//
//  NoItemsView.swift
//  todo_new
//
//  Created by dev on 08.06.2022.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate:Bool =  false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 15) {
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Start adding items by clicking on the add button")
                
                NavigationLink( destination: AddView(),
                                label:{
                    Text("Add some tasks.")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:60)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                        .padding(20)
                })
//                .padding(.horizontal, animate ? 20 : 30)
                .padding(20)
                .scaleEffect(animate ? 1.05 : 1.0)
                .shadow(color: animate ? Color.black : Color.gray,
                        radius: 5, x: 0, y: 0)
                    
            }
            .frame(maxWidth: 300)
            
            //padding pt vstack
            .padding(.horizontal, 5)
            .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(40)
        .onAppear(perform: addAnimation)
    }
    
    
    func addAnimation () {
        
        guard !animate else {return}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
                
            ) {
                animate.toggle()
            }
        }
        
    }
    
    
}


struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("title")
        }
        .previewInterfaceOrientation(.portrait)
    }
}
