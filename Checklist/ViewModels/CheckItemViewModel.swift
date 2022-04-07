//
//  CheckItemViewModel.swift
//  Checklist
//
//  Created by zak on 7/4/2022.
//

import Foundation

class CheckItemViewModel: ObservableObject, Identifiable {
    @Published var CheckItem: CheckItemModel
    var id = UUID()
    var isChecked: Bool {
        get { CheckItem.isChecked }
        set { CheckItem.isChecked = newValue }
    }
    var oldChecked: Bool {
        get { CheckItem.oldChecked }
        set { CheckItem.oldChecked = newValue}
    }
    var name: String {
        get { CheckItem.itemName }
        set { CheckItem.itemName = newValue }
    }
    
    init (CheckItem: CheckItemModel = CheckItemModel()){
        self.CheckItem = CheckItem
    }
    
    func resetChecked() {
        oldChecked = isChecked
        isChecked = false
    }
    
    func undoReset() {
        isChecked = oldChecked
        oldChecked = false
    }
}
