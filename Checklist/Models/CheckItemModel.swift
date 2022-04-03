//
//  CheckItemModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//
import Foundation

class CheckItemModel: Identifiable {
    var id = UUID()
    var itemName: String
    var isChecked: Bool
    
    init(itemName: String, isChecked: Bool){
        self.itemName = itemName
        self.isChecked = isChecked
    }
}
