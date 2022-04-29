//
//  ChecklistViewModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//
import Foundation
import SwiftUI

/**
 A viewmodel for storing a ChecklistModel and a variable for checking if the undo button has been pressed. Includes functions for adding, removing, and moving items, and functionality for the undo button.
 */
class ChecklistViewModel: Identifiable, ObservableObject, Equatable {
    static func == (lhs: ChecklistViewModel, rhs: ChecklistViewModel) -> Bool {
        lhs.checkList == rhs.checkList
    }
    
    //Published so changes to the checklist and undoToggled value are observed
    @Published var checkList: ChecklistModel
    //True if the undo button has been pressed, false if not or if it is undone
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
    
    /**
     Adds an item to the checklist
     
     - Parameter item: A Check Item to be added to the checklist
     - Returns: Nothing
     */
    func addElement(item: CheckItemModel) {
        checkList.items.append(item)
    }
    
    /**
     Removes an item from the checklist
     
     - Parameter atOffsets: Index of the item to be removed
     - Returns: Nothing
     */
    func remove(atOffsets indices: IndexSet) {
        checkList.items.remove(atOffsets: indices)
    }
    
    /**
     Will check if the Undo button has been pressed.
     If it has not, each item in the checklist will have their isChecked value stored in oldChecked before setting isChecked to false.
     If it has, the oldChecked value is stored in isChecked and oldChecked is set to false.
     It will then toggle the undoToggled value for the checklist.
     
     - Returns: Nothing
     */
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
    
    /**
     Moves an item in the checklist
     
     - Parameters:
        - from: The index the item was originally located
        - to: The index the item is being moved to
     - Returns: Nothing
     */
    func move(from source: IndexSet, to destination: Int) {
            items.move(fromOffsets: source, toOffset: destination)
        }
}
