//
//  ChecklistModel.swift
//  Checklist
//
//  Created by zak on 5/4/2022.
//

import Foundation

struct ChecklistModel {
    var items: [CheckItemViewModel]
    var name: String
    
    init(items: [CheckItemViewModel] = [], name: String){
        self.items = items
        self.name = name
    }
}
