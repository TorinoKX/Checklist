//
//  CheckItemViewModel.swift
//  Checklist
//
//  Created by zak on 7/4/2022.
//

import Foundation

class CheckItemViewModel: ObservableObject {
    @Published var CheckItem: CheckItemModel
    var id = UUID()
    var isChecked: Bool {
        get { CheckItem.isChecked }
        set { CheckItem.isChecked = newValue }
    }
    var name: String {
        get { CheckItem.itemName }
        set { CheckItem.itemName = newValue }
    }
    
    init (CheckItem: CheckItemModel = CheckItemModel()){
        self.CheckItem = CheckItem
    }
}
