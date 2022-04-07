//
//  CheckItemModel.swift
//  Checklist
//
//  Created by zak on 26/3/2022.
//
import Foundation

class CheckItemModel: Identifiable, ObservableObject {
    @Published var itemName: String
    @Published var isChecked: Bool
    @Published var oldChecked: Bool
    
    init(itemName: String = "", isChecked: Bool = false, oldChecked: Bool = false){
        self.itemName = itemName
        self.isChecked = isChecked
        self.oldChecked = oldChecked
    }
}
