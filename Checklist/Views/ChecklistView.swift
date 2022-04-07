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
    @State var toggled = false
    
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
                    Button(action: {checkList.toggleItem(for: item); toggled=false}){
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
            .navigationTitle(editMode?.wrappedValue == .active ? "" : checkList.name)
            .navigationBarItems(trailing: HStack {
                Button(action: {
                    if toggled == false{
                        for item in checkList.checkList.items {
                            item.resetChecked()
                        }
                    }else {
                        for item in checkList.checkList.items {
                            item.undoReset()
                        }
                    }
                    toggled.toggle()
                }) {
                    Text(editMode?.wrappedValue == .active ? toggled == true ? "Undo Reset" : "Reset" : "")
                }.foregroundColor(toggled == true ? Color.red : Color.green)
                EditButton()
            })
        }
    }
}
