//
//  ChecklistView.swift
//  Checklist
//
//  Created by zak on 28/3/2022.
//

import SwiftUI
import Foundation

struct ChecklistView: View {
    @StateObject var checkList: ChecklistViewModel
    @Environment(\.editMode) var editMode
    @State var title = ""
    
    var body: some View {
        VStack{
            if editMode?.wrappedValue == .active {
                HStack {
                    Image(systemName: "pencil.circle").foregroundColor(.green)
                    TextField(checkList.name, text: $checkList.name)
                        .font(Font.largeTitle.weight(.bold))
                        
                }
                .padding()
            }
            List{
                ForEach( checkList.items, id: \.id){ item in
                    Button(action: {checkList.toggleItem(for: item); checkList.toggled=false}){
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
                            let newItem = CheckItemModel()
                            newItem.name = title
                            checkList.addElement(item: newItem)
                            title = ""
                        }
                    }
                }
            }
            .navigationTitle(editMode?.wrappedValue == .active ? "" : checkList.name)
            .navigationBarItems(trailing: HStack {
                Button(action: {
                    checkList.toggleUndo()
                }) {
                    Text(editMode?.wrappedValue == .active ? checkList.toggled == true ? "Undo Reset" : "Reset" : "")
                }.foregroundColor(checkList.toggled == true ? Color.red : Color.green)
                EditButton()
            })
        }
    }
}
