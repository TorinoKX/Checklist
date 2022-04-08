//
//  ChecklistViewModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//
import Foundation
import SwiftUI

class ChecklistViewModel: Identifiable, ObservableObject {
    @Published var checkList: ChecklistModel
    var toggled = false
    var id = UUID()
    var items: [CheckItemViewModel] {
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
    
    func addElement(item: CheckItemViewModel) {
        checkList.items.append(item)
    }
    
    func remove(atOffsets indices: IndexSet) {
        checkList.items.remove(atOffsets: indices)
    }
    
    func toggleItem(for checkItem: CheckItemViewModel){
        objectWillChange.send()
        checkItem.isChecked.toggle()
    }
    
    func toggleUndo(){
        if toggled == false{
            for item in checkList.items {
                item.resetChecked()
            }
        }else {
            for item in checkList.items {
                item.undoReset()
            }
        }
        toggled.toggle()
    }
    
}
