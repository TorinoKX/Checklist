//
//  ChecklistModel.swift
//  Checklist
//
//  Created by zak on 5/4/2022.
//

import Foundation

class ChecklistModel {
    var items: [CheckItemViewModel]
    var name: String
    
    init(items: [CheckItemViewModel] = [], name: String = "CheckList"){
        self.items = items
        self.name = name
    }
}
