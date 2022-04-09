//
//  CheckItemModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//
import Foundation

class CheckItemModel: Identifiable {
    var name: String
    var isChecked: Bool
    var oldChecked: Bool
    var id = UUID()
    
    //Initialises with default value of no name and not checked, also oldChecked is default false for the undo functionality
    init(name: String = "", isChecked: Bool = false, oldChecked: Bool = false){
        self.name = name
        self.isChecked = isChecked
        self.oldChecked = oldChecked
    }
}
