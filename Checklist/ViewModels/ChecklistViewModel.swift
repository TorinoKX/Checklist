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
    @Published var toggled = false
    var id = UUID()
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
    
    func addElement(item: CheckItemModel) {
        checkList.items.append(item)
    }
    
    func remove(atOffsets indices: IndexSet) {
        checkList.items.remove(atOffsets: indices)
    }
    
    func toggleItem(for checkItem: CheckItemModel){
        objectWillChange.send()
        checkItem.isChecked.toggle()
    }
    
    func toggleUndo(){
        if toggled == false{
            for item in checkList.items {
                item.oldChecked = item.isChecked
                item.isChecked = false
            }
        }else {
            for item in checkList.items {
                item.isChecked = item.oldChecked
                item.oldChecked = false
            }
        }
        toggled.toggle()
    }
}
