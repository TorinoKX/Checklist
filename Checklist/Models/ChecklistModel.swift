//
//  ChecklistModel.swift
//  Checklist
//
//  Created by zak on 5/4/2022.
//

import Foundation

/**
 A checklist (array of items) with a name.
 */
struct ChecklistModel: Codable, Equatable {
    //an array of items and a name
    var items: [CheckItemModel]
    var name: String
    
    //initialises with default value of an empty array with name "Checklist"
    init(items: [CheckItemModel] = [], name: String = "Checklist"){
        self.items = items
        self.name = name
    }
}
