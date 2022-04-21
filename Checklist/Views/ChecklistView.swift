//
//  ChecklistView.swift
//  Checklist
//
//  Created by zak on 28/3/2022.
//

import SwiftUI
import Foundation

struct ChecklistView: View {
    //stateobject so view is updated on changes
    @StateObject var checkList: ChecklistViewModel
    @Environment(\.editMode) var editMode
    //for checking if in darkmode
    @Environment(\.colorScheme) var colourScheme
    //state so title updates in textfield
    @State var title = ""
    var onChanged: () -> Void
    
    var body: some View {
        let withIndex = checkList.items.enumerated().map({ $0 })
        VStack{
            //if the view is in edit mode it will show an editable text field above the list for the checklist title
            if editMode?.wrappedValue == .active {
                HStack {
                    Image(systemName: "pencil.circle").foregroundColor(.green)
                    TextField(checkList.name, text: $checkList.name, onCommit: {
                        onChanged()
                    })
                        .font(Font.largeTitle.weight(.bold))
                        
                }
                .padding()
            }
            List{
                ForEach( withIndex, id: \.element.id){ index, item in
                    //each checklist item is a button which will toggle if it is checked or not and reset the undo toggle value
                    Button(action: {
                        checkList.toggleItem(for: &checkList.items[index])
                        checkList.undoToggled=false
                        onChanged()
                        
                    }){
                        HStack{
                            Text(item.name)
                            Spacer()
                            //check if checked, show a checkmark image if it is
                            if item.isChecked == true {
                                Image(systemName: "checkmark")
                            }
                        }.foregroundColor(colourScheme == .dark ? Color.white : Color.black)
                    }
                }.onDelete { itemNumbers in
                    checkList.items.remove(atOffsets: itemNumbers)
                    onChanged()
                }
                .onMove {
                    checkList.move(from: $0, to: $1)
                    onChanged()
                }
                //if view is in edit mode, show a text entry field at the bottom of the list to create a new checklist item
                if editMode?.wrappedValue == .active {
                    HStack {
                        Image(systemName: "plus.circle").foregroundColor(.green)
                        TextField("Enter new entry name", text: $title) {
                            var newItem = CheckItemModel()
                            newItem.name = title
                            checkList.addElement(item: newItem)
                            title = ""
                            onChanged()
                        }
                    }
                }
            }
            //if in edit mode show no title, otherwise show the checklist name
            .navigationTitle(editMode?.wrappedValue == .active ? "" : checkList.name)
            .navigationBarItems(trailing: HStack {
                //Button to call the toggleUndo function of checkList, if the view is in edit mode it will show either "Undo Reset" or "Reset" depending on undoToggled value, otherwise will have no text. Colour also changes
                Button(action: {
                    checkList.toggleUndo()
                    onChanged()
                }) {
                    Text(editMode?.wrappedValue == .active ? checkList.undoToggled == true ? "Undo Reset" : "Reset" : "")
                }.foregroundColor(checkList.undoToggled == true ? Color.red : Color.green)
                EditButton()
            })
        }
    }
}
