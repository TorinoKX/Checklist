//
//  CheckItemModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//
import Foundation

struct CheckItemModel: Identifiable, Codable, Equatable {
    //Name of an item, a variable to check if the item is checked and a variable to show the previous value upon resetting checks
    var name: String
    var isChecked: Bool
    var oldChecked: Bool
    var id = UUID()
    
    init(name: String = "", isChecked: Bool = false, oldChecked: Bool = false){
        self.name = name
        self.isChecked = isChecked
        self.oldChecked = oldChecked
    }
}
