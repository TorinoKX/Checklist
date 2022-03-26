//
//  CheckItemModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//

struct CheckItemModel {
    var itemName: String
    var isChecked: Bool
    
    init(itemName: String, isChecked: Bool){
        self.itemName = itemName
        self.isChecked = isChecked
    }
}
