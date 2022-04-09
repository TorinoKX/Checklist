//
//  CheckItemModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//
import Foundation

//this model is currently a class due to issues with loops and structs. My tutor is looking into this issue. For loops can be solved via enumeration but unsure on foreach loops.
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
