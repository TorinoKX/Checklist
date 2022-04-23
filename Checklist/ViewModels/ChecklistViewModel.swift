//
//  ChecklistViewModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//
import Foundation
import SwiftUI

class ChecklistViewModel: Identifiable, ObservableObject, Equatable {
    static func == (lhs: ChecklistViewModel, rhs: ChecklistViewModel) -> Bool {
        lhs.checkList == rhs.checkList
    }
    
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
    
    init(checkList: ChecklistModel = ChecklistModel()){
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
    func toggleItem(for checkItem: inout CheckItemModel){
        objectWillChange.send()
        checkItem.isChecked.toggle()
    }
    
    //called when the reset and undo buttons are pressed
    func toggleUndo(){
        if undoToggled == false{
            //when the undoToggled value is false it will store the checked value into another variable in the items and set the checked value to false
            for i in checkList.items.indices {
                checkList.items[i].oldChecked = checkList.items[i].isChecked
                checkList.items[i].isChecked = false
            }
        }else {
            //when the undoToggled value is true it will do the opposite
            for i in checkList.items.indices {
                checkList.items[i].isChecked = checkList.items[i].oldChecked
                checkList.items[i].oldChecked = false
            }
        }
        //toggles the value for undoToggled
        undoToggled.toggle()
    }
    
    //for moving the items in a list
    func move(from source: IndexSet, to destination: Int) {
            items.move(fromOffsets: source, toOffset: destination)
        }
}
