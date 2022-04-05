//
//  ChecklistModel.swift
//  Checklist
//
//  Created by zak on 5/4/2022.
//

import Foundation

class ChecklistModel {
    var items: [CheckItemModel]
    
    init(items: [CheckItemModel] = []){
        self.items = items
    }
}
