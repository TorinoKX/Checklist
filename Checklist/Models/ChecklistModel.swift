//
//  ChecklistModel.swift
//  Checklist
//
//  Created by zak on 5/4/2022.
//

import Foundation

struct ChecklistModel: Codable {
    //an array of items and a name
    var items: [CheckItemModel]
    var name: String
    
    //initialises with default value of an empty array with name "Checklist"
    init(items: [CheckItemModel] = [], name: String = "Checklist"){
        self.items = items
        self.name = name
    }
}
