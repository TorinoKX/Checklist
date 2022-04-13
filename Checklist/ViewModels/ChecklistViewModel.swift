//
//  ChecklistViewModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//
import Foundation
import SwiftUI

class ChecklistViewModel: Identifiable, ObservableObject {
    //Published so changes to the checklist and undoToggled value are observed
    @Published var checkList: ChecklistModel
    @Published var undoToggled = false
    var id = UUID()
    //For shorthand calling for items and name in view
    var items: [CheckItemModel] {
        get { checkList.items }
        set { checkList.items = newValue }
    }
    var name: String {
        get { checkList.name }
        set { checkList.name = newValue }
    }
    
    init(checkList: ChecklistModel){
        self.checkList = checkList
    }
    
    //appends an item to the array
    func addElement(item: CheckItemModel) {
        checkList.items.append(item)
    }
    
    //removes an item from the array
    func remove(atOffsets indices: IndexSet) {
        checkList.items.remove(atOffsets: indices)
    }
    
    //toggles the checked value for an item and tells the view to update
    func toggleItem(for checkItem: CheckItemModel){
        objectWillChange.send()
        checkItem.isChecked.toggle()
    }
    
    //called when the reset and undo buttons are pressed
    func toggleUndo(){
        if undoToggled == false{
            //when the undoToggled value is false it will store the checked value into another variable in the items and set the checked value to false
            for item in checkList.items {
                item.oldChecked = item.isChecked
                item.isChecked = false
            }
        }else {
            //when the undoToggled value is true it will do the opposite
            for item in checkList.items {
                item.isChecked = item.oldChecked
                item.oldChecked = false
            }
        }
        //toggles the value for undoToggled
        undoToggled.toggle()
    }
    
    func move(from source: IndexSet, to destination: Int) {
            items.move(fromOffsets: source, toOffset: destination)
        }
}
