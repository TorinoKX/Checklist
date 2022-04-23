//
//  DetailView.swift
//  Checklist
//
//  Created by zak on 28/3/2022.
//

import SwiftUI
import Foundation

struct DetailView: View {
    //stateobject so view is updated on changes
    @StateObject var checkList: ChecklistViewModel
    //To check when the view is in edit mode
    @Environment(\.editMode) var editMode
    //Declaration of onChanged function from MasterView
    var onChanged: () -> Void
    
    var body: some View {
        VStack{
            //if the view is in edit mode it will show an editable text field above the list for the checklist title
            if editMode?.wrappedValue == .active {
                HStack {
                    Image(systemName: "pencil.circle").foregroundColor(.green)
                    TextField(checkList.name, text: $checkList.name, onCommit: {
                        //Once checklist name is committed, the data is saved
                        onChanged()
                    })
                    .font(Font.largeTitle.weight(.bold))
                }
                .padding()
            }
            List{
                //passes checklist and onChanged function into the Item list view
                CheckItemListView(checkList: checkList, onChanged: onChanged)
                //if view is in edit mode, show a text entry field at the bottom of the list to create a new checklist item
                if editMode?.wrappedValue == .active {
                    AddItemView(checkList: checkList, onChanged: onChanged)
                }
            }
            //if in edit mode show no title, otherwise show the checklist name
            .navigationTitle(editMode?.wrappedValue == .active ? "" : checkList.name)
            .navigationBarItems(trailing: HStack {
                //Button to call the toggleUndo function of checkList
                Button(action: {
                    checkList.toggleUndo()
                    onChanged()
                }) {
                    //if the view is in edit mode the button will show either "Undo Reset" or "Reset" depending on undoToggled value, otherwise will have no text. Colour also changes
                    Text(editMode?.wrappedValue == .active ? checkList.undoToggled == true ? "Undo Reset" : "Reset" : "")
                }.foregroundColor(checkList.undoToggled == true ? Color.red : Color.green)
                EditButton()
            })
        }
    }
}
