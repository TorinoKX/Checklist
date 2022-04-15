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
    @Binding var masterList: [ChecklistViewModel]
    //for checking if in darkmode
    @Environment(\.colorScheme) var colourScheme
    //state so title updates in textfield
    @State var title = ""
    
    var body: some View {
        let withIndex = checkList.items.enumerated().map({ $0 })
        VStack{
            //if the view is in edit mode it will show an editable text field above the list for the checklist title
            if editMode?.wrappedValue == .active {
                HStack {
                    Image(systemName: "pencil.circle").foregroundColor(.green)
                    TextField(checkList.name, text: $checkList.name, onCommit: {
                        ChecklistApp.save(masterList: masterList)
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
                        ChecklistApp.save(masterList: masterList)
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
                    ChecklistApp.save(masterList: masterList)
                }
                .onMove {
                    checkList.move(from: $0, to: $1)
                    ChecklistApp.save(masterList: masterList)
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
                            ChecklistApp.save(masterList: masterList)
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
                    ChecklistApp.save(masterList: masterList)
                }) {
                    Text(editMode?.wrappedValue == .active ? checkList.undoToggled == true ? "Undo Reset" : "Reset" : "")
                }.foregroundColor(checkList.undoToggled == true ? Color.red : Color.green)
                EditButton()
            })
        }
    }
}
