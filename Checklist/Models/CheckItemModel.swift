//
//  CheckItemModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//
import Foundation

struct CheckItemModel: Identifiable, Codable {
    //Name of an item, a variable to check if the item is checked and a variable to show the previous value upon resetting checks
    var name: String = ""
    var isChecked: Bool = false
    var oldChecked: Bool = false
    var id = UUID()
}
