//
//  AddView.swift
//  todo_new
//
//  Created by dev on 07.06.2022.
//

import SwiftUI

struct AddView: View {

    let SecondaryAccentColor = Color("SecondaryAccentColor")
    let PlaceholderColor = Color("Placeholder")
    
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldText: String = ""
    @EnvironmentObject var listViewModel:ListViewModel

    @State var alertTitle:String = ""
    @State var showAlert:Bool = false
    
    
    var body: some View {
        
        ScrollView {
            VStack {
                TextField("type smt here", text: $textFieldText)
                    .foregroundColor(PlaceholderColor)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    
                
                Button ( action: saveButtonPressed,
                    label: {
                    Text("Save")
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                })
            }
            .foregroundColor(.white)
            .padding(14)
    
        }
        .navigationTitle("Add an item ")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        
        if textIsApporopiate() == true {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsApporopiate() -> Bool {
        if textFieldText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || textFieldText.count < 2 {
            alertTitle = "incorrect format"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
