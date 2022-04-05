//
//  ChecklistView.swift
//  Checklist
//
//  Created by zak on 28/3/2022.
//

import SwiftUI

struct ChecklistView: View {
    @ObservedObject var checkList: ChecklistViewModel
    @Environment(\.editMode) var editMode
    @State var title = ""
    var body: some View{
        List{
            ForEach(checkList.items, id: \.id){ item in
                HStack{
                    Text(item.itemName)
                    if (item.isChecked == true){
                        Spacer()
                        Image(systemName: "checkmark")
                    }
                }
            }.onDelete { itemNumbers in
                checkList.remove(atOffsets: itemNumbers)
            }
        }
        .navigationTitle(checkList.name)
    }
}
