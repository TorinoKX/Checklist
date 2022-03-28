//
//  ChecklistView.swift
//  Checklist
//
//  Created by zak on 28/3/2022.
//

import SwiftUI

func ChecklistView(checkList:ChecklistViewModel) -> some View {
    
    return List(checkList.items, id: \.id){ item in
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
