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
    
    var body: some View {
        List{
            ForEach( checkList.items, id: \.id){ item in
                Button(action: {checkList.toggleItem(for: item)}){
                    HStack{
                        Text(item.name)
                        Spacer()
                        Image(systemName: item.isChecked ? "checkmark" : "")
                    }.foregroundColor(Color.black)
                }
            }.onDelete { itemNumbers in
                checkList.items.remove(atOffsets: itemNumbers)
            }
            if editMode?.wrappedValue == .active {
                HStack {
                    Image(systemName: "plus.circle").foregroundColor(.green)
                    TextField("Enter new entry name", text: $title) {
                        @ObservedObject var newItem = CheckItemViewModel()
                        newItem.name = title
                        checkList.addElement(item: newItem)
                        title = ""
                    }
                }
            }
        }
        .navigationTitle(checkList.name)
        .navigationBarItems(trailing: EditButton())
    }
}
