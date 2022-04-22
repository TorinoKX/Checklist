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
    //state so title updates in textfield
    var onChanged: () -> Void
    
    var body: some View {
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
                CheckItemRowView(checkList: checkList, onChanged: onChanged)
                //if view is in edit mode, show a text entry field at the bottom of the list to create a new checklist item
                if editMode?.wrappedValue == .active {
                    AddItemView(checkList: checkList, onChanged: onChanged)
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
