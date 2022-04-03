//
//  ChecklistView.swift
//  Checklist
//
//  Created by zak on 28/3/2022.
//

import SwiftUI

struct ChecklistView: View {
    var checkList: ChecklistViewModel
    var body: some View{
    return List(checkList.items, id: \.id){ item in
        HStack{
            Text(item.itemName)
            if (item.isChecked == true){
                Spacer()
                Image(systemName: "checkmark")
            }
        }
    }
    .navigationTitle(checkList.name)
    }
}
