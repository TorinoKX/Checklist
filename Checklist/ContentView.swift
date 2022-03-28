//
//  ContentView.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//

import SwiftUI

struct ContentView: View {
    let checkList: ChecklistViewModel
    
    var body: some View {
        NavigationView{
            List(checkList.items, id: \.id){ item in
                HStack{
                    Text(item.itemName)
                    if (item.isChecked == true){
                        Spacer()
                        Image(systemName: "checkmark")
                    }
                }
            }
            .navigationTitle(/*@START_MENU_TOKEN@*/"Fruits"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(checkList: ChecklistViewModel())
    }
}
