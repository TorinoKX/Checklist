//
//  ChecklistModel.swift
//  Checklist
//
//  Created by zak on 5/4/2022.
//

import Foundation

struct ChecklistModel {
    var items: [CheckItemModel]
    var name: String
    
    //default with empty array and name of "Checklist"
    init(items: [CheckItemModel] = [], name: String = "Checklist"){
        self.items = items
        self.name = name
    }
}
